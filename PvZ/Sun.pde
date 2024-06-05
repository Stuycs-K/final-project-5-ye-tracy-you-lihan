import java.util.*;

public class Sun {
  private PVector pos;
  private PVector vel;
  private int stopPoint;
  
  public Sun(int x, int y, int vx, int vy) {
    pos = new PVector(x,y);
    vel = new PVector(vx,vy);
    stopPoint = int(random(150,500));
  }
  
  public int getX() { return (int)pos.x; }
  public int getY() { return (int)pos.y; }
  public PVector getPos() { return pos; }
  public PVector getVel() { return vel; }
  public int getStopPoint() { return stopPoint; }
  
  public void setPos(PVector x) { pos = x; }
  
  void display() {
    image(sun, pos.x, pos.y);
  }

}
