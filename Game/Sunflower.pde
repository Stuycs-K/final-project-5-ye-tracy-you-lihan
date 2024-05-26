import java.util.*;

public class Sunflower extends Entity{
  int maxHP, currHP, ATK, cost, coolDown;
  PImage img;
  
  public Sunflower() {
    super(-100,-100, "Sunflower", 50);
  }
  
  public Sunflower(int r, int c) {
    super(r, c, "Sunflower", 50);
    maxHP = 300;
    currHP = 300;
    ATK = 0;
    cost = 50;
    coolDown = 5;
    img = sunflower;
  }
  
  public void display() {
    image(sunflower, (getRow()+2)*100, (getCol()+1)*100);
  }
  
  public void skill() {
    if (getTick()%5 == 0) {
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
