class circle {
  PVector pos, vel;
  
  circle(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(6, 0);
  }
  
  void display() {
    circle(pos.x + 50, pos.y, 70);
  }
  
  void moveL() {
    pos = Game.move(pos, vel, "L");
    display();
  }
}
