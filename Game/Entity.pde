public abstract class Entity {
  private int row, col, currHP;
  private String name;
  private int cost;
  
  public Entity(int r, int c, String n, int cost, int hp) {
    this.row = r;
    this.col = c;
    this.name = n;
    this.cost = cost;
    this.currHP = hp;
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
  public int getHP() {
    return currHP;
  }
  public void setHP(int atk) {
    currHP -= atk;
  }
  
  public abstract void display();
  public abstract void skill();
  
}
