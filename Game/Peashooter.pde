import java.util.*;

class Peashooter extends Entity{
  int maxHP, currHP, ATK, t;
  
  public Peashooter() {
    super(-100,-100, "Peashooter", 100, 100, 5, 7);
  }
  
  public Peashooter(int r, int c) {
    super(r, c, "Peashooter", 100, 100, 5, 7);
    maxHP = 300;
    currHP = 300;
    ATK = 20;
    t = (int)getTick()%5;
  }
  
  void display() {
    image(peashooter, ((getRow()+2)*100)-20, (getCol()+1)*100);
  }
  
  void skill() {
    if ((getTick()+t)%1.5 == 0) {
      Game.peas.add(new Pea(((getRow()+2)*100)-20, (getCol()+1)*100));
    }
  }
}
