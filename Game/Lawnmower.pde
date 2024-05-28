import java.util.*;
class Lawnmower{
  PVector pos, vel;
  boolean activate;
  Lawnmower(int r, int c){
    pos = new PVector(r, c);
    vel = new PVector(10, 0);
    activate = false;
  }

  public void display() {
    image(lawnmower, pos.x, pos.y);
  }
  
  public void skill() {
      pos = Game.move(pos, vel, "R");
      for (int z = 0; z < Game.zombies.size(); z++) {
        if (zombies.get(z).pos.x <= pos.x && zombies.get(z).pos.y >= pos.y) {
          Game.zombies.remove(z);
          z--;
        }
      }
  }
  
}
