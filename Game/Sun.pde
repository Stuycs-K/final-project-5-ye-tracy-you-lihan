import java.util.*;

public class Sun {
  PVector pos;
  PVector vel;
  PImage sun;
  
  public Sun(int x, int y, int vx, int vy, PImage img) {
    pos = new PVector(x,y);
    vel = new PVector(vx,vy);
    sun = img;
  }
  
  void display() {
    image(sun, pos.x, pos.y);
  }

}
