import java.util.*;

public class Wallnut extends Entity {
  
  public Wallnut() {
    super("Wallnut", wallnut, -100, -100, 100, 2000, 0, 10, 10);
  }
  
  public Wallnut(int r, int c) {
    super("Wallnut", wallnut, r, c, 100, 2000, 0, 10, 10);
  }
  
  void display() {
    if (getHP() > 1000) {
      image(getImg(), (getRow()+2)*100, (getCol()+1)*100);
    } else {
      setImg(halfwallnut);
      image(getImg(), (getRow()+2)*100, (getCol()+1)*100);
    }
  }
  
  void skill() {}
}
