
class PeaShooter extends Entity {
  private ArrayList<Pea> pelletList;
  PeaShooter(){
    super("peaShooter", 125, 20, 100);
    pelletList = new ArrayList<Pea>();
  }
  
  void display(int x, int y) {
    PImage peashooter = loadImage("peaShooter.jpg");
    peashooter.resize(80,80);
    image(peashooter,x,y);
  }
  
  void fire(int x, int y) {
    
  }
}
