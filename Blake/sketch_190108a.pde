//setting variable
float zoom = 5;
float ca = 0;
float cb = 0;

void setup() {
  size(800, 450);
}
void draw() {
  
  //zooms in when 'w' is pressed, zooms out when 's' is pressed
  if (keyPressed){
    if ((key == 'w' || key == 'W') && zoom >= 0.1) {
      zoom = zoom -0.05;
    }
    else if ((key == 's' || key == 'S') && zoom <= 10) {
      zoom = zoom +0.05;
    }
  }
  
  //increases real portion of c when 'd' is pressed, decreases when 'a' is pressed
  if (keyPressed){
    if ((key == 'a' || key == 'A')  && ca >= -3) {
      ca = ca -0.05;
    }
    else if ((key == 'd' || key == 'D')  && ca <= 3) {
      ca = ca +0.05;
    }
  }
  
  //increases imaginary portion of c when 'e' is pressed, decreases when 'q' is pressed
  if (keyPressed){
    if ((key == 'q' || key == 'Q')  && cb >= -3) {
      cb = cb -0.05;
    }
    else if ((key == 'e' || key == 'E')  && cb <= 3) {
      cb = cb +0.05;
    }
  }


  //setting width and height of julia set
  float w = zoom;
  float h = (w * height) / width;

  // Starting point changed by mouse movement
  float xmin = -w/2 + map(mouseX, 0, width, 2, -2);
  float ymin = -h/2 + map(mouseY, 0, width, 1.3, -3);

  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 100;

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

      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        //breaks once 16 is reached
        if (aa + bb > 16.0) {
          break;  // Bail
        }
        //calculating new a and b for next iteration
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        n++;
      }

      // If pixel never reached 16
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        //the closer n is to maxiterations, the greater hu is
        float hu = (float(n) / maxiterations)*255;
        pixels[i+j*width] = color(hu+15, 0, hu*5);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}
