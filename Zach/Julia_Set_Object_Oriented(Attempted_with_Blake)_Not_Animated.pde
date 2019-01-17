// Adapted from Daniel Shiffman's Julia set code
// Original code: https://github.com/CodingTrain/website/blob/master/CodingChallenges/CC_022_JuliaSet/Processing/CC_022_JuliaSet/CC_022_JuliaSet.pde

Julia Jset;

void setup() {
  size(640, 360);
  colorMode(HSB, 1);
	Jset = new Julia;
	this.angle = 0;
	this.r = 0.6839;
	this.ca = this.r*cos(this.angle);//sin(angle);
  this.cb = this.r*sin(this.angle);
	// It all starts with the width, try higher or lower values
  //float w = abs(sin(angle))*5;
  this.w = 4;
  this.h = (this.w * this.height) / this.width;
	// Start at negative half the width and height
  this.xmin = -this.w/2;
  this.ymin = -this.h/2;
	// Maximum number of iterations for each point on the complex plane
  this.maxiterations = 100;
  // x goes from xmin to xmax
  this.xmax = this.xmin + this.w;
  // y goes from ymin to ymax
 	this.ymax = this.ymin + this.h;
  // Calculate amount we increment x,y for each pixel
  this.dx = (this.xmax - this.xmin) / (this.width);
  this.dy = (this.ymax - this.ymin) / (this.height);
}

class Julia {
	//increases angle by 0.01
	void change () {
		this.angle += 0.01;
	}
}

void draw() {

  // Make sure we can write to the pixels[] array.
  // Only need to do this once since we don't do any other drawing.
  loadPixels();
	
			// Start y
		float y = this.ymin;
		for (int j = 0; j < height; j++) {
			// Start x
			float x = this.xmin;
			for (int i = 0; i < width; i++) {

				// Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
				float a = x;
				float b = y;
				int n = 0;
				while (n < this.maxiterations) {
					float aa = a * a * a / b;
					float bb = b * b * b / a;
					// Infinity in our finite world is simple, let's just consider it 16
					if (aa + bb > 4.0) {
						break;  // Bail
					}
					float twoab = 3.0 * a * a * b * b;
					a = aa - bb + this.ca;
					b = twoab + this.cb;
					n++;
				}

				// We color each pixel based on how long it takes to get to infinity
				// If we never got there, let's pick the color black
				if (n == this.maxiterations) {
					pixels[i+j*width] = color(100);
				} else {
					// Gosh, we could make fancy colors here if we wanted
					float hu = sqrt(float(n) / this.maxiterations);
					pixels[i+j*width] = color(hu, 255, 150);
				}
				x += this.dx;
			}
			y += this.dy;
		}
	
	Jset.change();
	
  updatePixels();
  println(frameRate);
}


	 
