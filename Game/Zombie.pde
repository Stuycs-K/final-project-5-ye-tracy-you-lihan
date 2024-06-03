import java.util.*;

public class Zombie{
  private PVector pos, vel;
  private int hp, atk, freeze;
  private PImage img;
  
  public Zombie(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(10,0);
    hp = 190;
    atk = 100;
    img = zombie;
    freeze = 0;
  }
  
  public PVector getPos() { return pos; }
  public float getX() { return pos.x; }
  public float getY() { return pos.y; }
  public int getHP() { return hp; }
  public PVector getVel() { return vel; }
  public int getFreeze() { return freeze; }
  
  public void setHP(int x) { hp = x; }
  public void setPos(PVector x) { pos = x; }
  
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
      img = fZombie;
      freeze = 5;
      vel = new PVector(0, 0);
    }
  }
  
  public void setFreeze() {
    freeze -= 1;
    if (freeze == 0) {
    img = zombie;
    vel = new PVector(10,0);
    }
  }
}
