import java.util.*;

public class Sun {
  PVector pos;
  PVector vel;
  int stopPoint;
  
  public Sun(int x, int y, int vx, int vy) {
    pos = new PVector(x,y);
    vel = new PVector(vx,vy);
    stopPoint = int(random(150,500));
  }
  
  int getX() { return (int) pos.x; }
  int getY() { return (int) pos.y; }
  
  void display() {
    image(sun, pos.x, pos.y);
  }

}
