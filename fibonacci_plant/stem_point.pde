class StemPoint {
  PVector loc;
  float aura;

  StemPoint(PVector loc) {
    this.loc = loc;
  }

  void display() {
    noStroke();
    fill(0,0,255,20);
    float r = sqrt(aura) * STEM_CORTEX;
    ellipse(loc.x, loc.y, r, r);
  }
}

