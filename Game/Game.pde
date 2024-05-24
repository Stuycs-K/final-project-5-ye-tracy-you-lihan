import java.util.*;

static double tick;
static int suns;
static Entity[][] plants;
static ArrayList<Entity> zombies;
static ArrayList<Sun> allSuns;

Entity[] menu;

// -------------------------------------------------------------------------
PImage sun;
// -------------------------------------------------------------------------

void draw() 
{
  drawBackground();
  tick++;
  
  randomSunDrop();
  for (Sun s : allSuns) {
    s.display();
    s.pos = move(s.pos, s.vel, "D");
  }
}


void setup() 
{
  frameRate(60);
  size (1200,750);
  drawBackground();
  
  allSuns = new ArrayList<Sun>();
  
  sun = loadImage("sun.gif");
  sun.resize(75,75);
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
  if (getTick()%1 == 0) {
    allSuns.add(new Sun((int)random(200,1100),0,0,5,sun));
  }
    
    
    // -----
  //Sun x = new Sun(500,500,0,10,sun);
  //x.display();
  //x.pos = move(x.pos, x.vel, "D");
  //println(x.pos);
}

public static PVector move(PVector position, PVector velocity, String dir) 
{
  if (dir.equals("L")) {
    return position.add(PVector.mult(velocity,-1));
  }
  else if (dir.equals("R")) {
    return position.add(velocity);
  }
  else if (dir.equals("D")) {
    return position.add(velocity);
  }
  else if (dir.equals("U")) {
    return position.add(PVector.mult(velocity,-1));
  }
  else {
    println("invalid direction");
    return position;
  }
}
