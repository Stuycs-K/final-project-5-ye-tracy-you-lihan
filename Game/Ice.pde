import java.util.*;

public class Ice extends Entity{
  
  public Ice() {
    super("Ice", ice, -100, -100, 0, 1, 0, 10, 10);
  }
  
  public Ice(int r, int c) {
    super("Ice", ice, r, c, 0, 1, 0, 10, 10);
  }
  
  public void display() {
    image(getImg(), (getRow()+2)*100, (getCol()+1)*100);
  }
  
  public void skill() {
    for (Zombie z : zombies) {
      int myX = (getRow()+2)*100;
      int myY = (getCol()+1)*100;
      if (z.getX() >= myX-100 && z.getX() < myX+100 && z.getY() == myY) {
        z.debuff("ice");
        setHP(1);
        break;
      }
    }
  }
  
}
