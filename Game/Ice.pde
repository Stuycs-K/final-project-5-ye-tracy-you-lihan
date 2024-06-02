import java.util.*;

public class Ice extends Entity{
  int ATK;
  PImage img;
  
  public Ice() {
    super(-100, -100, "Ice", 0, 1, 10, 10);
  }
  
  public Ice(int r, int c) {
    super(r, c, "Ice", 0, 1, 10, 10);
    ATK = 0;
    img = ice;
  }
  
  public void display() {
    image(img, (getRow()+2)*100, (getCol()+1)*100);
  }
  
  public void skill() {
    for (Zombie z : zombies) {
      int myX = (getRow()+2)*100;
      int myY = (getCol()+1)*100;
      if (z.pos.x > myX && z.pos.x < myX+100 && z.pos.y == myY) {
        z.debuff("ice");
        setHP(1);
        break;
      }
    }
  }
  
}
