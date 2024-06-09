public class Shovel extends Entity{
  public Shovel() {
    super("Shovel", shovel, -100, -100, 0, 0, 0, 4, 1);
  }
  
  public Shovel(int x, int y) {
    super("Shovel", shovel, x, y, 0, 0, 0, 15, 10);
  }
  
  public void display() {
    image(getImg(), ((getRow()+2)*100), (getCol()+1)*100);
  }
  
  public void skill(ArrayList<Zombie> zombies, ArrayList<Sun> allSuns, double tick) {
     
  }
}
