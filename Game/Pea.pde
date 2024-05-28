import java.util.*;

public class Pea {
  PVector pos;
  PVector vel;
  int stopPoint, ATK;
  
  public Pea(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(5,0);
    stopPoint = 1200;
    ATK = 20;
  }
  
  void display() {
    image(sun, pos.x, pos.y);
  }

}
