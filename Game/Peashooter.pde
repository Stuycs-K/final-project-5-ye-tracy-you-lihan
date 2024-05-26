class Peashooter extends Entity {
  int maxHP, currHP, ATK, coolDown;
  PImage img;
  
  public Peashooter(int r, int c) {
    super(r, c, "Sunflower", 100);
    maxHP = 300;
    currHP = 300;
    ATK = 20;
    coolDown = 4;
    img = peashooter;
  }
  
  void display() {
    image(img, getRow(), getCol()); 
  }
  
  void skill() {
  }
}
