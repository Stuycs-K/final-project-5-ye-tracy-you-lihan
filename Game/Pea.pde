import java.util.*;

public class Pea {
  private PVector pos;
  private PVector vel;
  private int stopPoint;
  
  public Pea(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(4,0);
    stopPoint = 1100;
  }
  
  public int getX() { return (int)pos.x; }
  public int getY() { return (int)pos.y; }
  
  public void setPos(PVector x) { pos = x; }
  
  void display() {
    image(pea, pos.x+40, pos.y);
  }

}
