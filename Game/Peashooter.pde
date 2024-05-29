import java.util.*;

class Peashooter extends Entity{
  int maxHP, currHP, ATK, coolDown, t;
  
  public Peashooter() {
    super(-100,-100, "Peashooter", 100);
  }
  
  public Peashooter(int r, int c) {
    super(r, c, "Peashooter", 100);
    maxHP = 300;
    currHP = 300;
    ATK = 20;
    coolDown = 2;
    t = (int)getTick()%5;
  }
  
  void display() {
    image(peashooter, getRow()-25, getCol());//(getRow()+2)*100, (getCol()+1)*100);
  }
  
  void display(int x, int y) {
    image(peashooter, x, y);
  }
  
  void skill() {
    if ((getTick()+t)%1.5 == 0) {
      Game.peas.add(new Pea(getRow(), getCol()));
    }
  }
}
