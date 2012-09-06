class Plant {
  PVector loc;
  Stem stem;
  Spire corcule;
  ArrayList spires = new ArrayList();
  ArrayList angles = new ArrayList();

  
  Plant() {
    loc = new PVector(width/2, height/2);
    stem = new Stem(this);
    // first spire
    corcule = new Spire(0, 1, 0, color(255,0,0));
    spires.add(corcule);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);

    stem.display();
    // display spires and leafs between they
    //
    beginShape();
    for (int i=0; i<spires.size(); i++) {
      Spire s = (Spire)spires.get(i);
      s.display();

      // display leafs
      //
      Spire cp1, p1, p2, cp2;
      cp1 = (Spire)spires.get(max(0, i-2));
      p1 = (Spire)spires.get(max(0, i-1));
      p2 = s;
      fill(0,50,0, 100);
      stroke(0,100,0,i==0 ? 255:100);
      if (i == spires.size()-1) {
        // this is the first spire. draw curve from button
        curve(cp1.loc.x, cp1.loc.y, p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y, stem.button.loc.x, stem.button.loc.y);
        // dummy ellipse becoz of curve bug
        ellipse(cp1.loc.x, cp1.loc.y, 0, 0);
      } else {
        cp2 = (Spire)spires.get(min(i+1, spires.size()-1));
        curve(cp1.loc.x, cp1.loc.y, p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y, cp2.loc.x, cp2.loc.y);
      }
    }
    endShape();

    // display fibonacci spirals
    displaySpirals();
    // display angles between spires
    displayAngles();
    popMatrix();
  } // display

  void update() {
    // pause growth when mouse is pressed
    if (mousePressed) {
      return;
    }

    for (int i=0; i<spires.size(); i++) {
      Spire s = (Spire)spires.get(i);
      s.update();
    }

    checkNewBorn();
    stem.update();
  } // update


  // display angles between new spires
  //
  void displayAngles() {
    float opacity;
    for (int i=0; i<angles.size(); i++) {
      PVector angle = (PVector)angles.get(i);
      Spire s = (Spire)spires.get(i+1);
      float arc_r = s.loc.mag();

      // inside steam draw solid arc
      // and after steam border draw fading out flash and show angle
      if (arc_r < STEM_D) {
        opacity = 0.5;
        stroke(255,0,255, 255.0 * opacity);
        fill(255,0,255, 100.0 * opacity);
        arc(0, 0, arc_r, arc_r, angle.x, angle.y);
      } else {
        opacity = STEM_D / pow(abs(STEM_D-arc_r),1.7);
        stroke(255,0,255, 255.0 * opacity);
        fill(255,0,255, 100.0 * opacity);
        arc(0, 0, arc_r, arc_r, angle.x, angle.y);
      
        // show text
        //
        float mid = (angle.x + angle.y)/2;
        float x = arc_r/2 * cos(mid),
              y = arc_r/2 * sin(mid);
        fill(255,255,50, 255*opacity);
        String txt = round(angle.z*100)/100.0 + "°";
        textAlign(CENTER, CENTER);
        text(txt, x, y);
      }
    }
  } // displayAngles
  
  // draw fibonacci spirals
  //
  void displaySpirals() {
    displaySpiral(5, color(255,255,0));
    displaySpiral(8, color(0,255,255));
  }

  void displaySpiral(int n, color c) {
    for (int i=0; i<n; i++) {
      for (int s=i; s<spires.size(); s+=n) {
        if (s < 2*n || s+n >= spires.size()) {
          continue;
        }
        Spire cp1, p1, p2, cp2;
        cp1 = (Spire)spires.get(s - 2*n);
        p1 = (Spire)spires.get(s - 1*n);
        p2 = (Spire)spires.get(s + 0*n);
        cp2 = (Spire)spires.get(s + 1*n);
        noFill();
        stroke(c,100);
        curve(cp1.loc.x, cp1.loc.y, p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y, cp2.loc.x, cp2.loc.y);
        // dummy ellipse becoz of curve bug
        ellipse(cp1.loc.x, cp1.loc.y, 0, 0);
      }
    }
  } // displaySpiral

  void checkNewBorn() {
    // when younger spire reached steam border create new steam
    //
    if (corcule.loc.mag() > STEM_R) {
      // add angle
      angles.add(getAngles(stem.button.loc, corcule.loc));

      PVector p = stem.button.loc.normalize(null);
      if (RANDOM_SPIRES != 0) {
        p.x *= random(100-RANDOM_SPIRES,100+RANDOM_SPIRES)/100.0;
        p.y *= random(100-RANDOM_SPIRES,100+RANDOM_SPIRES)/100.0;
      }
      corcule = new Spire(spires.size(), p.x, p.y, color(255,0,0));
      spires.add(corcule);
    }
  } // checkNewBorn
  
  // calculate angles between spires
  //
  PVector getAngles(PVector sp1, PVector sp2) {
      float a1 = sp1.heading2D(),
            a2 = sp2.heading2D();
      float as = min(a1, a2),
            ae = max(a1, a2);
      if (ae - as > PI) {
        float tmp = as;
        as = ae;
        ae = TWO_PI + tmp;
      }
      return new PVector(as, ae, degrees(ae-as));
  } // getAngles

  // calculate aura strength between two points
  //
  float getAuraStrength(PVector point, PVector spire) {
    float radius2 = pow(spire.x-point.x, 2) + pow(spire.y-point.y, 2);
    // max precision is 1 pixel
    if (radius2 > 1) {
      return 1.0 / radius2;
    } else {
      return 1;
    }
  } // getAuraStrength
  
  // calculate average vector at the `point`
  //
  float getAuraStrengthSumm(PVector point) {
    float e_summ = 0;
    for (int i=0; i<spires.size(); i++) {
      Spire s = (Spire)spires.get(i);
      e_summ += getAuraStrength(point, s.loc);
    }
    return e_summ;
  } // getAuraStrengthSumm

}
