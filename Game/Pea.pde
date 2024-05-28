import java.util.*;

public class Pea {
  PVector pos;
  PVector vel;
  int stopPoint, ATK;
  
  public Pea(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(3,0);
    stopPoint = 1200;
    ATK = 20;
  }
  
  void display() {
    image(pea, pos.x, pos.y);
  }

}
