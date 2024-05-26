public abstract class Entity {
  private int row, col;
  private String name;
  private int cost;
  
  public Entity(int r, int c, String n, int cost) {
    this.row = r;
    this.col = c;
    this.name = n;
    this.cost = cost;
  }
  
  public int getRow() {
    return row;
  }
  public int getCol() {
    return col;
  }
  public String getName() {
    return name;
  }
  public int getCost() {
    return cost;
  }
  
  public abstract void display();
  public abstract void skill();
  
}
