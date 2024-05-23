import java.util.*;

double tick;
int suns;
Entity[][] plants;
ArrayList<Entity> zombies;
ArrayList<Sun> randSuns;
Entity[] menu;

// -------------------------------------------------------------------------
PImage sun;
// -------------------------------------------------------------------------

void draw() 
{
  tick++;
  randomSunDrop();
}


void setup() 
{
  frameRate(60);
  size (1200,750);
  drawBackground();
  
  // ------------------
  
  sun = loadImage("sun.gif");
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



void randomSunDrop() 
{
  Sun x = new Sun(500,100,0,10);
  x.display(x.pos, 75, sun);
  x.move(x.pos, x.vel, "D");
}



void display(PVector position, int size, PImage img) 
{
  img.resize(size,size);
  image(img, position.x, position.y);
}
