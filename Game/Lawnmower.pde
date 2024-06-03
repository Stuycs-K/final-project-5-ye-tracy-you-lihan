import java.util.*;
class Lawnmower{
  private PVector pos, vel;
  private boolean activate;
  
  Lawnmower(int r, int c){
    pos = new PVector(r, c);
    vel = new PVector(10, 0);
    activate = false;
  }
  
  public int getX() { return (int)pos.x; }
  public int getY() { return (int)pos.y; }

  public void display() {
    image(lawnmower, pos.x, pos.y);
  }
  
  public void skill() {
      pos = Game.move(pos, vel, "R");
      for (int z = 0; z < Game.zombies.size(); z++) {
        if (zombies.get(z).getY() == this.pos.y && zombies.get(z).getX() <= pos.x && zombies.get(z).getY() >= pos.y) {
          Game.zombies.remove(z);
          z--;
        }
      }
  }
  
}
