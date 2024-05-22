import java.util.*;

int tick;
int suns;
// Entity[][] plants;
// ArrayList<Entity> zombies;
// Entity[] menu;

void setup() 
{
      // Background  
  size (1200,750);
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



void draw() {}
void randomSunDrop() {}
