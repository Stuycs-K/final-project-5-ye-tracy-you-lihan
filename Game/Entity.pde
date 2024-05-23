abstract class Entity {
  private int HP, currHP, ATK, cost;
  private String name;
  
  Entity(String type, int maxHP, int atk, int cst) {
    this.name = type;
    this.HP = maxHP;
    this.ATK = atk;
    this.cost = cst;
    this.currHP = maxHP;
  }
  
  int getHP(){ return currHP; }
  int getATK(){ return ATK; }
  int getCost(){ return cost; }
  String getName(){ return name; }
  
  
  void setHP(int health){ this.HP = health; }
  void setName(String type){ this.name = type; }
 
  void applyATK(int damage) { this.currHP -= damage; }
}
