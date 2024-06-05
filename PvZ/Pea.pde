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
  
  public int getX() { return (int)pos.x; }
  public int getY() { return (int)pos.y; }
  public void setPos(PVector x) { pos = x; }

  int getATK() {
    return ATK; 
  }
  
  void display() {
    image(pea, pos.x+40, pos.y);
  }

}
