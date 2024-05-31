import java.util.*;

public class Zombie{
  PVector pos, vel;
  int hp, atk;
  PImage img;
  
  public Zombie(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(10,0);
    hp = 190;
    atk = 100;
    img = zombie;
  }
  
  public void display() {
    image(img, pos.x, pos.y-15);
  }
  
  public void attack(Entity x) {
    if (getTick()%2 == 0) {
      noStroke();
      fill(#ff0000, 150);
      rect(x.getRow()*100+200, x.getCol()*100+100, 100, 130);
      x.setHP(this.atk);
    }
  }
  public void debuff(String type) {
    if (type.equals("ice")) {
      println("e");
    }
  }
  
}
