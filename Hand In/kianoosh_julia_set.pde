float ang = 0;
float angIncr = 0;
float r=0.7885;
float iter = 0;
void setup() {
  size(600, 600);
  colorMode(HSB);
}
void draw() {

  float ca = r*cos(0.05*ang);
  float cb = r*sin(0.05*ang);
  
  angIncr += sin(0.1*iter);
  ang += angIncr;
  
  float w = 5;
  float h = (w * height) / width;
  loadPixels();
  
  int maxiterations = 10;

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
        if (sq(a) + sq(b) > 16.0) {
          break;  // Bail
        }
        float twoab = 2.0 * a * b;
        a = sq(a) - sq(b) + ca;
        b = twoab + cb;
        n++;
       }
       if (n == maxiterations) {
        float hu = (sqrt(float(n) / maxiterations))*255;    //hue
        pixels[i+j*width] = color(hu%256, 150, 255);
      } else {
        float hu = (sqrt(float(n) / maxiterations))*255;    //hue
        pixels[i+j*width] = color(hu%256, 150, 255);
      }
      x+= dx;
    }
    y += dy;
  }
  updatePixels();
  iter++;
}
