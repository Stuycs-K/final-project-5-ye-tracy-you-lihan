import java.util.*;

static double tick;
static int suns;
static Entity[][] plants;
static ArrayList<Entity> zombies;
static ArrayList<Entity> lawnmowers;
static ArrayList<Sun> allSuns;
static Entity[] menu;

// -------------------------------------------------------------------------
static PImage sun;
static PImage sunflower;
static PImage peashooter;
static PImage lawnmower;
// -------------------------------------------------------------------------

void draw() 
{
  drawBackground();
  drawMenu();
  tick++;
  
  Sunflower x = new Sunflower(4, 2);
  x.display();
  x.skill();
  
  randomSunDrop();
  for (int i = 0; i < allSuns.size(); i++) {
    Sun s = allSuns.get(i);
    s.display();
    if (s.stopPoint >= s.pos.y) {
      s.pos = move(s.pos, s.vel, "D");
    }
    if (mousePressed) {
      if (mouseX > s.pos.x && mouseX < s.pos.x+75 && mouseY > s.pos.y && mouseY < s.pos.y+75) {
        allSuns.remove(s);
        i--;
        suns += 50;
      }
    }
  }
  
  //for(Entity z : zombies) {
  //  if(z.getCol() < 200) {
  //    //y = z.getRow();
  //    //Lawnmower.skill();
  //  }
  //}
}


void setup() 
{
  frameRate(60);
  size (1200,750);
  lawnmowers = new ArrayList<Entity>();
  
  allSuns = new ArrayList<Sun>();
  suns = 0;
  plants = new Entity[9][5];
  menu = new Entity[1];
  menu[0] = new Sunflower();
  
  sun = loadImage("sun.gif");
  sun.resize(75,75);
  sunflower = loadImage("sunflower.png");
  sunflower.resize(90, 90);
  peashooter = loadImage("peaShooter.jpg");
  peashooter.resize(90,90);
  lawnmower = loadImage("Lawnmower.jpg");
  lawnmower.resize(90, 90);
  
  drawBackground();
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
  
  for(int y = 100; y < 600; y += 100) {
    //Entity temp = new Lawnmower(120, y);
    lawnmowers.add(new Lawnmower(120, y));
    image(lawnmower, 120, y);
  }
      // menu
   stroke(#d1b38a);
   fill(#d1b38a);
   rect(0,600,1200,150);
}

void randomSunDrop() 
{
  if (getTick()%10 == 0) {
    allSuns.add(new Sun((int)random(250,1000),0,0,5));
  }
}

void drawMenu()
{
  fill(#e6dcc3);
  rect(25,625,200,100);
  fill(0, 100);
  textSize(22);
  for (Entity x : menu) {
    text(x.getName(), 125, 655);
    image(sunflower, 30, 630);
    if (suns < x.getCost()) {
      fill(#ff0000, 150);
    }
    textSize(50);
    text(x.getCost(), 145, 705);
  }
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
