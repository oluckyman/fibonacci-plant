float STEM_R = 34; // stem radius
float STEM_D = STEM_R*2;
float STEM_CORTEX = 50; // glowth of stem cortex when the new spire is born
float GROWTH_V = 0.6; // spire growth velocity
float SPIRE_SIZE = 5;  // maximum length of spire (in screen sizes)
float RANDOM_SPIRES = 10; // add indeterminacy to spire vector calculations (0 = off)
Boolean LINE_SPEED = false; // if true then spire growing with constant velocity and SPIRE_SIZE ignored

// math constants
float PHI = (1 + sqrt(5)) / 2;
float GOLDEN_ANGLE = degrees(TWO_PI*(1 - 1/PHI));

Plant p;
Info info;
PVector offset = new PVector(0,0,0);
float z_vel = 0; // velocity of z-moving by right mouse


void setup() {
  size(600, 600, P3D);
  p = new Plant();
  info = new Info(p);

  smooth();
  textFont(createFont("verdana", 10));
}


void draw() {
  background(#000000);

  pushMatrix();
  translations();
  p.display();
  p.update();
  popMatrix();

  info.display();
  info.update();
}


// move view point
//
void translations() {
  if (mousePressed) {
    // x-y translations
    //
    if (mouseButton == LEFT) {
      offset.x += mouseX-pmouseX;
      offset.y += mouseY-pmouseY;
    }
    // z translations
    //
    if (mouseButton == RIGHT) {
      z_vel += (height/2 - mouseY)/(height/2.0);
    }
  }
  z_vel *= 0.99;
  offset.z += z_vel;
  translate(offset.x, offset.y, offset.z);
}
