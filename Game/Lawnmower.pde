class Lawnmower extends Entity {
  PVector pos, vel;
  
  
  Lawnmower(int r, int c){
    super(r, c, "Lawnmower", 0);
    pos = new PVector(r, c);
    vel = new PVector(10, 10);
  }
  
  public void display() {
    image(lawnmower, getRow(), getCol());
  }
  
  public void skill() {
    //for (Entity z : 
  }
}
