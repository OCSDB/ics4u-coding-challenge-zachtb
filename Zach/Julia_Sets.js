// Adapted from Daniel Shiffman's Julia set code
// Original code: https://github.com/CodingTrain/website/blob/master/CodingChallenges/CC_022_JuliaSet/Processing/CC_022_JuliaSet/CC_022_JuliaSet.pde
// Coded in OpenProcessing
// Already object oriented (the code written are just the methods of sketch.js)
// For more information visit https://processing.org/ 

float angle = 0;
float r = 0.6839;

void setup() {
  size(640, 360);
  colorMode(HSB, 1);
}
void draw() {

  // float ca = map(mouseX, 0, width, -1, 1);//-0.70176;
  // float cb = map(mouseY, 0, height, -1, 1);//-0.3842;

  float ca = r*cos(angle);//sin(angle);
  float cb = r*sin(angle);

  angle += 0.01;

  background(255);

  // Establish a range of values on the complex plane
  // A different range will allow us to "zoom" in or out on the fractal

  // It all starts with the width, try higher or lower values
  //float w = abs(sin(angle))*5;
  float w = 4;
  float h = (w * height) / width;

  // Start at negative half the width and height
  float xmin = -w/2;
  float ymin = -h/2;

  // Make sure we can write to the pixels[] array.
  // Only need to do this once since we don't do any other drawing.
  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 10;

  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + h;

  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width; i++) {

      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aaa_divb = a * a * a / b;
        float bbb_diva = b * b * b / a;
        // Infinity in our finite world is simple, let's just consider it 16
        if (aaa_divb + bbb_diva > 4.0) {
          break;  // Bail
        }
        float three_aabb = 3.0 * a * a * b * b;
        a = aaa_divb - bbb_diva + ca;
        b = three_aabb + cb;
        n++;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(100);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        float hu = sqrt(float(n) / maxiterations);
        pixels[i+j*width] = color(hu, 255, 150);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}
