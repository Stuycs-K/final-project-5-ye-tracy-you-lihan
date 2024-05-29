class circle {
  PVector pos, vel;
  int currHP;
  circle(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(1, 0);
    currHP = 40;
  }
  
  void display() {
    circle(pos.x, pos.y+50, 70);
  }
  
  void moveL() {
    pos = Game.move(pos, vel, "L");
    display();
  }
}
