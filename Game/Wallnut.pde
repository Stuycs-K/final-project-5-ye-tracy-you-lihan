class Wallnut extends Entity {
  
  int t;
  public Wallnut() {
    super(-100,-100, "Wallnut", 100, 300);
  }
  
  public Wallnut(int r, int c) {
    super(r, c, "Wallnut", 100, 300);
    //coolDown = 5;
    t = (int)getTick()%5;
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
