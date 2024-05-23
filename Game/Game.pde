import java.util.*;

double tick;
int suns;
Entity[][] plants;
ArrayList<Entity> zombies;
ArrayList<Sun> randSuns;

Entity[] menu;
Sun x;

// -------------------------------------------------------------------------
PImage sun, pea, peaShooter, sunflower, zombie;
// -------------------------------------------------------------------------

void draw() 
{
  drawBackground();
  tick++;
  randomSunDrop();
  x.move(x.pos, x.vel, "D");
  println(x.pos);
}


void setup() 
{
  frameRate(60);
  size (1200,750);
  drawBackground();
  
  sun = loadImage("sun.gif");
  x = new Sun(500,100,0,10);
}



double getTick()       //  **** When calling a skill every x seconds, call with 
{                      //  getTick()%x == 0 & keep in mind that it's a double ****
  return tick/60;
}



void drawBackground() 
{
      // Background  
  background(#f7efda);
  
      // fence
  PImage fence = loadImage("fencing.jpg");
  fence.resize(1000,100);
  image(fence, 200, 0);
  
      // field                       **** each patch of grass is 100x100 pixels! ****
  PImage yard = loadImage("yard.jpg");
  yard.resize(900,500);
  image(yard,200,100);
  
      // house
  PImage house = loadImage("house.jpg");
  house.resize(200,630);
  image(house,0,0);
  
      // road
  PImage road = loadImage("road.jpg");
  road.resize(100,610);
  image(road,1100,0);
  
      // menu
   stroke(#d1b38a);
   fill(#d1b38a);
   rect(0,600,1200,150);
}

<<<<<<< HEAD
=======
// --------------------------------------------------------------------------------------------------------------
Display methods
// --------------------------------------------------------------------------------------------------------------
void displayPeashooter(int x, int y) {
  peaShooter = loadImage("peaShooter.jpg");
  peaShooter.resize(80, 80);
  image(pea,x,y);
}

void displayPea(int x, int y) {
  pea = loadImage("pea.jpg");
  pea.resize(40, 40);
  image(pea,x,y);
}

void displayZombie(int x, int y) {
  zombie = loadImage("zombie.jpg");
  zombie.resize(90, 90);
  image(zombie, x, y);
}
// --------------------------------------------------------------------------------------------------------------

>>>>>>> 41356b90b9f464117579897dd4d81f8524787225
void randomSunDrop() 
{
  //x = new Sun(500,100,0,10, sun);
  image(sun,x.pos.x, x.pos.y);
  x.move(x.pos, x.vel, "D");
}
<<<<<<< HEAD
=======

// --------------------------------------------------------------------------------------------------------------

void display(PVector position, int size, PImage img) 
{
  img.resize(size,size);
  image(img, position.x, position.y);
}

// --------------------------------------------------------------------------------------------------------------

void firePea() {
  PImage 
}
>>>>>>> 41356b90b9f464117579897dd4d81f8524787225
