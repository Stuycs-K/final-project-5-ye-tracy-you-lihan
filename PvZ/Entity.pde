public abstract class Entity {
  private int row, col, cost, currHP, atk, startCooldown, cooldown;
  private String name;
  private PImage img;
  
  public Entity(String n, PImage i,int r, int c, int cost, int hp, int atk, int sCD, int CD) {
    this.name = n;
    this.img = i;
    this.row = r;
    this.col = c;
    this.cost = cost;
    this.currHP = hp;
    this.atk = atk;
    this.startCooldown = sCD;
    this.cooldown = CD;
  }
  
  public String getName() { return name; }
  public PImage getImg() { return img; }
  public int getRow() { return row; }
  public int getCol() { return col; }
  public int getCost() { return cost; }
  public int getHP() { return currHP; }
  public int getATK() { return atk; }
  public int getOGC() { return startCooldown; }
  public int getCooldown() { return cooldown; }
  
  public void setImg(PImage x) { img = x; }
  public void setHP(int atk) { currHP -= atk; }
  public void setCooldown() { cooldown = startCooldown; }
  public void setSpecialCD() { cooldown = 5; }
  public void minusCooldown() { cooldown -= 1; }
  
  public abstract void display();
  public abstract void skill();
  
}
