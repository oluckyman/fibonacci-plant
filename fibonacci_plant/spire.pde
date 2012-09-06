class Spire {
  int index;
  PVector loc;
  PVector vel;
  color c;

  float mag;


  Spire(int i_, float x_, float y_, color c_) {
    index = i_;
    loc = new PVector(x_, y_);
    vel = new PVector(x_, y_);
    vel.normalize();
    vel.mult(GROWTH_V);
    c = c_;
  }
  
  void display() {
    float opacity = 1 / sqrt(this.mag/50 + 1);
    stroke(c, 255*opacity);
    fill(c, 100);
    line(0, 0, loc.x, loc.y);
    float spire_r = 4;
    ellipse(loc.x, loc.y, spire_r, spire_r);
    fill(255,255,255, 200);
    text(index, loc.x+2, loc.y+2);
  }

  void update() {
    if (LINE_SPEED) {
      loc.add(vel);
    } else {
      PVector velocity;
      this.mag = loc.mag();
      if (this.mag < STEM_R) {
        velocity = vel;
      } else if (this.mag > SPIRE_SIZE * width) {
        velocity = new PVector(0,0);
      } else {
        velocity = PVector.mult(vel, (1 - this.mag/(SPIRE_SIZE*width)));
      }
      loc.add(velocity);
    }
  }
}
