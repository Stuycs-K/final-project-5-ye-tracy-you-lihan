import java.util.*;

public class Sun extends Game{
  PVector pos;
  PVector vel;
  PImage sun;
  
  public Sun(int x, int y, int vx, int vy) {
    pos = new PVector(x,y);
    vel = new PVector(vx,vy);
  }
}
