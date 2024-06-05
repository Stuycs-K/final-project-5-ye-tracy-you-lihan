import java.util.*;

public class Sunflower extends Entity{
  private int tickDelay;
  
  public Sunflower() {
    super("Sunflower", sunflower, -100, -100, 50, 300, 0, 5, 0);
    tickDelay = (int)getTick()%5;
  }
  
  public Sunflower(int r, int c) {
    super("Sunflower", sunflower, r, c, 50, 300, 0, 5, 0);
    tickDelay = (int)getTick()%5;
  }
  
  public void display() {
    image(getImg(), (getRow()+2)*100, (getCol()+1)*100);
  }
  
  public void skill() {
    if ((getTick()+tickDelay)%5 == 0) {
      if ((int)(Math.random()*2) == 0) {
        allSuns.add(new Sun((getRow()+2)*100+60, (getCol()+1)*100+20, 0, 0));
      }
      else {
        allSuns.add(new Sun((getRow()+2)*100-40, (getCol()+1)*100+40, 0, 0));
      }
    }
  }
  
}
