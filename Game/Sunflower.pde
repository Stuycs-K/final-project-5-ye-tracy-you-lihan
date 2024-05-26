import java.util.*;

public class Sunflower extends Entity{
  int maxHP, currHP, ATK, coolDown, t;
  PImage img;
  
  public Sunflower() {
    super(-100,-100, "Sunflower", 50);
  }
  
  public Sunflower(int r, int c) {
    super(r, c, "Sunflower", 50);
    maxHP = 300;
    currHP = 300;
    ATK = 0;
    coolDown = 5;
    img = sunflower;
    t = (int)getTick()%5;
  }
  
  public void display() {
    image(sunflower, (getRow()+2)*100, (getCol()+1)*100);
  }
  
  public void skill() {
    if ((getTick()+t)%5 == 0) {
      if ((int)(Math.random()*2) == 0) {
        allSuns.add(new Sun((getRow()+2)*100+60, (getCol()+1)*100+20, 0, 0));
      }
      else {
        allSuns.add(new Sun((getRow()+2)*100-40, (getCol()+1)*100+40, 0, 0));
      }
    }
  }
  
  //public void hpBar() {}
  
}
