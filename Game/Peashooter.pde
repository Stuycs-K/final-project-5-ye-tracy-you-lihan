import java.util.*;

public class Peashooter extends Entity{
  int tickDelay;
  
  public Peashooter() {
    super("Peashooter", peashooter, -100, -100, 100, 300, 20, 5, 5);
    tickDelay = (int)getTick()%5;
  }
  
  public Peashooter(int r, int c) {
    super("Peashooter", peashooter, r, c, 100, 300, 20, 5, 5);
    tickDelay = (int)getTick()%5;
  }
  
  void display() {
    image(getImg(), ((getRow()+2)*100)-20, (getCol()+1)*100);
  }
  
  
  void skill() {
    if ((getTick()+tickDelay)%1.5 == 0) {
      Game.peas.add(new Pea(((getRow()+2)*100)-20, (getCol()+1)*100));
    }
  }
}
