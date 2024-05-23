
class PeaShooter extends Entity {
  private ArrayList<Pea> pelletList;
  PeaShooter(){
    super("peaShooter", 125, 20, 100);
    pelletList = new ArrayList<Pea>();
  }
}
