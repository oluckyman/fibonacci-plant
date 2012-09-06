class Stem {
  Plant plant;
  ArrayList stemPoints = new ArrayList();
  StemPoint button;

  Stem(Plant plant) {
    this.plant = plant;

    // init cortex points
    //
    float rad, x,y;
    float degree_step = 180 / (PI*STEM_R) / 10;
    for (float d=0; d<360; d+=degree_step) {
      rad = radians(d);
      x = cos(rad) * STEM_R;
      y = sin(rad) * STEM_R;
      StemPoint sp = new StemPoint(new PVector(x,y));
      this.stemPoints.add(sp);
    }
    // init button to any created point
    this.button = (StemPoint)this.stemPoints.get(0);
  }

  void display() {
    noStroke();
    fill(0,0,255, 30);
    ellipse(0, 0, STEM_D, STEM_D);

    for(int i=0; i<stemPoints.size(); i++) {
      StemPoint sp = (StemPoint)stemPoints.get(i);
      sp.display();
    }

    // display button
    float br = 4;
    fill(255,255,0);
    ellipse(button.loc.x, button.loc.y, br, br);
  }
  
  void update() {
    int bt = 0;
    for(int i=0; i<stemPoints.size(); i++) {
      StemPoint sp = (StemPoint)stemPoints.get(i);
      sp.aura = plant.getAuraStrengthSumm(sp.loc);
      if (sp.aura < button.aura) {
        // after loop button = point with weakest aura
        bt = i;
        button = sp;
      }
    }
  }
}

