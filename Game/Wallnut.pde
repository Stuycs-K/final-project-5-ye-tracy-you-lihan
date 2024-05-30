class Wallnut extends Entity {
  public Wallnut() {
    super(-100,-100, "Wallnut", 100, 300, 5, 15);
  }
  
  public Wallnut(int r, int c) {
    super(r, c, "Wallnut", 100, 2000, 10, 20);
  }
  
  void display() {
    if (getHP() > 150) {
      image(wallnut, (getRow()+2)*100, (getCol()+1)*100);
    } else {
      image(halfwallnut, (getRow()+2)*100, (getCol()+1)*100);
    }
  }
  
  void skill() {
  }
}
