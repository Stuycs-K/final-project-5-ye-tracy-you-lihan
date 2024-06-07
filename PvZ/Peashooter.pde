import java.util.*;

public class Peashooter extends Entity{
  private int tickDelay;
  
  public Peashooter() {
    super("Peashooter", peashooter, -100, -100, 100, 300, 20, 5, 5);
    tickDelay = 0;
  }
  
  public Peashooter(int r, int c, int tick) {
    super("Peashooter", peashooter, r, c, 100, 300, 20, 5, 5);
    tickDelay = tick;
  }
  
  void display() {
    image(getImg(), ((getRow()+2)*100)-20, (getCol()+1)*100);
  }
  
  
  void skill(ArrayList<Zombie> zombies, ArrayList<Sun> allSuns) {
    if ((getTick()+tickDelay)%1.5 == 0) {
      PvZ.peas.add(new Pea(((getRow()+2)*100)-20, (getCol()+1)*100));
    }
  }
}
