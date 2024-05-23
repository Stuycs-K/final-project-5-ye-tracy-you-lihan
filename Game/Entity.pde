abstract class Entity {
  private int HP, currHP, ATK, cost;
  private String name;
  private int x, y;
  
  Entity(String type, int maxHP, int atk, int cst, int X, int Y) {
    this.name = type;
    this.HP = maxHP;
    this.ATK = atk;
    this.cost = cst;
    this.currHP = maxHP;
    this.x = X;
    this.y = Y;
  }
  
  int getHP(){ return currHP; }
  int getATK(){ return ATK; }
  int getCost(){ return cost; }
  String getName(){ return name; }
  
  
  void setHP(int health){ this.HP = health; }
  void setName(String type){ this.name = type; }
 
  void applyATK(int damage) { this.currHP -= damage; }
}
