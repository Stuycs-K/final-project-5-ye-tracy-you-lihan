import java.util.*;

public class Pea {
  PVector pos;
  PVector vel;
  int ATK; 
  
  public Pea(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(4,0);
    ATK = 20;
  }
  
  int getX() { return (int) pos.x; }
  int getY() { return (int) pos.y; }
  
  int getATK() {
    return ATK; 
  }
  
  void display() {
    image(pea, pos.x+40, pos.y);
  }

}
