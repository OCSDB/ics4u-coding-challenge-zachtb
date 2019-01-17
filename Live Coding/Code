float angle = 0;
float r=0.7885;

void setup() {
  size(800, 640);
}
void draw() {

  float ca = r*cos(angle);
  float cb = r*sin(angle);

  angle += 0.005;

  float w = 5;
  float h = (w * height) / width;

  loadPixels();

  int maxiterations = 100;

  float dx = (w) / (width);
  float dy = (h) / (height);

  float y = -h/2;
  for (int j = 0; j < height; j++) {
    float x = -w/2;
    for (int i = 0; i < width; i++) {

      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        if (aa + bb > 16.0) {
          break;  // Bail
        }
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        n++;
      }

      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        float hu = (sqrt(float(n) / maxiterations))*255;
        pixels[i+j*width] = color(hu+15, 0, hu*1.5);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}
