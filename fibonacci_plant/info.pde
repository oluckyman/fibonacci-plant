// Display list of angles between spires
//
class Info {
  Plant plant;

  Info(Plant p) {
    this.plant = p;
  }

  void display() {
    for (int i=0; i<plant.angles.size(); i++) {
      PVector a = (PVector)plant.angles.get(i);
      String txt = round(a.z*100)/100.0 + "°";
      txt += " (" + round((a.z)/GOLDEN_ANGLE * 10000) / 100.0 + "%)";
      textAlign(LEFT, TOP);
      fill(200,0,0);
      text(txt, 5, 5+(plant.angles.size()-i-1)*14);
    }
  }

  void update() {
  }
}
