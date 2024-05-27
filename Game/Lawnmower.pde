import java.util.*;
class Lawnmower{
  PVector pos, vel;
  int timer;
  Lawnmower(int r, int c){
    //super(r, c, "Lawnmower", 0);
    pos = new PVector(r, c);
    vel = new PVector(5, 0);
    timer = 0;
  }

  public void display() {
    image(lawnmower, pos.x, pos.y);
  }
  
  public void skill() {
    while (pos.x < 1100) {
      pos = Game.move(pos, vel, "R");
      for (int z = 0; z < Game.zombies.size(); z++) {
        if (Game.zombies.get(z).pos.x <= pos.x && Game.zombies.get(z).pos.y >= pos.y) {
          Game.zombies.remove(z);
          z--;
        }
      }
    }
  }
  
}
