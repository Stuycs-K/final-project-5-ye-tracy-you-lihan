import java.util.*;

class Peashooter extends Entity{
  int maxHP, currHP, ATK, coolDown, t;
  
  public Peashooter(int r, int c) {
    super(r, c, "Peashooter", 100);
    maxHP = 300;
    currHP = 300;
    ATK = 20;
    coolDown = 2;
    t = (int)getTick()%5;
  }
  
  void display() {
    image(peashooter, getCol(), getRow());//(getRow()+2)*100, (getCol()+1)*100);
  }
  
  void skill() {
    if ((getTick()+t)%2 == 0) {
      Game.peas.add(new Pea(getCol(), getRow()));
    }
  }
}
