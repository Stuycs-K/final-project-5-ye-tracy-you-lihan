import java.util.*;

public class Zombie{
  PVector pos, vel;
  int hp, atk;
  PImage img;
  
  public Zombie(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(5,0);
    img = zombie;
  }
  
  public void display() {
    image(img, pos.x, pos.y);
  }
  
}
