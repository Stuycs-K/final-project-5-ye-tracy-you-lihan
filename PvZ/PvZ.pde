import java.util.*;

Game PvZ;

PImage selection;
PImage load, windows, ex, file, pVz, mine, val, ffox, trash, endscreen, pauseIMG, waveM, endTitle;

// -------------------------------------------------------------------------
PImage sun;
PImage sunflower;
PImage lawnmower;
PImage peashooter;
PImage pea;
PImage zombie;
PImage wallnut, halfwallnut;
PImage ice;
PImage fZombie;
PImage shovel;
// -------------------------------------------------------------------------

void draw() 
{ 
  PvZ.run();
}

void setup() 
{
  frameRate(60);
  size (1200,750);
  
  PvZ = new Game();
  selection = sun;

  //images for plants and zombies 
  sun = loadImage("sun.gif");
  sun.resize(75,75);
  sunflower = loadImage("sunflower.png");
  sunflower.resize(90, 90);
  peashooter = loadImage("peaShooter.png");
  peashooter.resize(150,90);
  pea = loadImage("pea.png");
  pea.resize(60, 60);
  lawnmower = loadImage("Lawnmower.png");
  lawnmower.resize(100, 100);
  zombie = loadImage("zombie.png");
  zombie.resize(90,120);
  wallnut = loadImage("walnut.png");
  wallnut.resize(90, 90);
  halfwallnut = loadImage("halfwallnut.png");
  halfwallnut.resize(120, 120);
  ice = loadImage("ice.png");
  ice.resize(90, 90);
  fZombie = loadImage("frozenZombie.png");
  fZombie.resize(90, 120);
  
  shovel = loadImage("shovel.png");
  shovel.resize(90, 90);
  
  // start menu 
  load = loadImage("start.png");
  load.resize((int)(1200*0.6),(int)(750*0.6));
  windows = loadImage("windows.jpg");
  windows.resize(1200,750);
  ex = loadImage("ex.png");
  ex.resize((int)(140*0.3),(int)(50*0.3));
  file = loadImage("file.png");
  file.resize(50,50);
  pVz = loadImage("pVz.png");
  pVz.resize(50,50);
  mine = loadImage("mine.png");
  mine.resize(50,50);
  val = loadImage("val.png");
  val.resize(50,50);
  trash = loadImage("trash.png");
  trash.resize(50,50);
  ffox = loadImage("ffox.png");
  ffox.resize(50,50);
  
  //end screen
  endscreen = loadImage("endScreen.jpg");
  endscreen.resize(1200, 750);
  endTitle = loadImage("newEndTitle.png");
  endTitle.resize(504, 300);
  
  // pause
  pauseIMG = loadImage("pause.png");
  pauseIMG.resize(300, 300);
  
  // wave
  waveM = loadImage("waveM.png");
  waveM.resize((int)(waveM.width*0.7), (int)(waveM.height*0.7));

}

void mouseClicked() {
  PvZ.buyPlants();
}

void mouseReleased() {
  PvZ.placePlants();
}

void keyPressed(){
  PvZ.checkKey();
}
