public abstract class Entity {
  private int row, col, currHP;
  private String name;
  private int cost;
  private int ogCooldown, cooldown;
  
  public Entity(int r, int c, String n, int cost, int hp, int startCooldown, int cooldown) {
    this.row = r;
    this.col = c;
    this.name = n;
    this.cost = cost;
    this.currHP = hp;
    this.ogCooldown = cooldown;
    this.cooldown = startCooldown;
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
  public int getOGC() {
    return ogCooldown;
  }
  public int getCooldown() {
    return cooldown;
  }
  public void setCooldown() {
    cooldown = ogCooldown;
  }
  public void minusCooldown() {
    cooldown -= 1;
  }
  
  public abstract void display();
  public abstract void skill();
  
}
