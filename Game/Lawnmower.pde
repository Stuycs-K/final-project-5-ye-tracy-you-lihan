import java.util.*;
class Lawnmower{
  PVector pos, vel;
  
  Lawnmower(int r, int c){
    //super(r, c, "Lawnmower", 0);
    pos = new PVector(r, c);
    vel = new PVector(10, 0);
  }

  public void display() {
    image(lawnmower, pos.x, pos.y);
  }
  
  public int skill() {
    int total = 0;
    pos = Game.move(pos, vel, "R");
    for (int z = 0; z < Game.zombies.size(); z++) {
      if (Game.zombies.get(z).pos.x == pos.x) {
        Game.zombies.remove(z);
        total++;
      }  
    }
    return total;
  }
}
