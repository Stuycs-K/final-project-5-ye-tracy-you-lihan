import java.util.*;

static double tick;
static int suns;
static Entity[] menu;
static Entity[][] plants;
static ArrayList<Zombie> zombies;
static ArrayList<Lawnmower> lawnmowers;
static ArrayList<Sun> allSuns;
static ArrayList<Pea> peas;

boolean activate, select;
PImage selection;

boolean start;
PImage load, windows, ex, file, pVz, mine, val, ffox, trash;

// -------------------------------------------------------------------------
static PImage sun;
static PImage sunflower;
static PImage lawnmower;
static PImage peashooter;
static PImage pea;
static PImage zombie;
static PImage wallnut, halfwallnut;
static PImage ice;
static PImage fZombie;
// -------------------------------------------------------------------------

void draw() 
{ 
  if (start == false) {
    drawStart();
  } 
  else {
    drawBackground();
    drawMenu();
    updateLawnmower();
    tick++;
    cooldown();
    
    for (int i = 0; i < plants.length; i++) {
      for (int j = 0; j < plants[0].length; j++) {
        if (plants[i][j] != null) { 
          plants[i][j].display();
          if (!plants[i][j].getName().equals("Ice")) {
            plants[i][j].skill();
          }
        }
      }
    }
    
    randomSunDrop();
    for (int i = 0; i < allSuns.size(); i++) {
      Sun s = allSuns.get(i);
      s.display();
      if (s.getStopPoint() >= s.getY()) {
        s.setPos(move(s.getPos(), s.getVel(), "D"));
      }
      if (mousePressed) {
        if (mouseX > s.getX() && mouseX < s.getX()+75 && mouseY > s.getY() && mouseY < s.getY()+75) {
          allSuns.remove(s);
          i--;
          suns += 50;
        }
      }
    }
    
    if (getTick()%4 == 0) {
      randomZombieSpawn();
    }
    zombieMove();
    
    for(int z = 0; z < zombies.size(); z++) {
      Zombie currZomb = zombies.get(z);
      if(currZomb.getX() < 220) {
        for (int l = 0; l < lawnmowers.size(); l++) {
          Lawnmower currLawn = lawnmowers.get(l);
          if (currLawn.getY() == currZomb.getY()) {
            currLawn.skill();
            currLawn.activate = true;
          }
        }
      }
     }
  
    if (select == true) {
      followMouse(selection);
    }
  }
  updatePeas();
}

void setup() 
{
  frameRate(60);
  size (1200,750);
  activate = false;

  suns = 75;
  selection = sun;
  select = false;
  start = false;
  plants = new Entity[9][5];
  peas = new ArrayList<Pea>();
  allSuns = new ArrayList<Sun>();
  lawnmowers = new ArrayList<Lawnmower>();
  zombies = new ArrayList<Zombie>();
  
  for(int y = 100; y < 600; y += 100) {
    lawnmowers.add(new Lawnmower(120, y));
  }

  menu = new Entity[4];
  menu[0] = new Sunflower();
  menu[1] = new Peashooter();
  menu[2] = new Wallnut();
  menu[3] = new Ice();
  
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
   
      // currency
   fill(#d1b38a);
   rect(980,10,200,50);
   fill(#e6dcc3);
   rect(985,15,190,40);
   textSize(35);
   fill(0, 80);
   text("SUNS : " + suns, 995, 48);
}

void updateLawnmower(){
  for(int l = 0; l < lawnmowers.size(); l++) {
    if (lawnmowers.get(l).activate) {
      lawnmowers.get(l).skill();
    }
    lawnmowers.get(l).display();
    if(lawnmowers.get(l).getX() > 1200) {
      lawnmowers.remove(l);
    }
  }
}

void updatePeas() {
  for (int p = 0; p < peas.size(); p++) {
    Pea currPea = peas.get(p);
    currPea.display();
    for (int z = 0; z < zombies.size(); z++) {
      Zombie currZomb = zombies.get(z);
      if (currZomb.getX()-80 <= currPea.getX() && currZomb.getY() == currPea.getY()) {
        currZomb.setHP(currZomb.getHP() - 20);
        if (currZomb.getHP() <= 0) {
          zombies.remove(z);
        }
        peas.remove(p);
        p--;
      }
    }
    currPea.setPos(move(currPea.pos, currPea.vel, "R"));
  }
}

void randomSunDrop() 
{
  if (getTick()%10 == 0) {
    allSuns.add(new Sun((int)random(250,1000),0,0,5));
  }
}

void drawMenu()
{
  for (Entity x : menu) {
    if (x.getName().equals("Sunflower")) {
      fill(#e6dcc3);
      rect(25,625,200,100);
      fill(0, 100);
      textSize(22);
      text(x.getName(), 125, 655);
      image(sunflower, 30, 630);
      if (suns < x.getCost()) {
        fill(#ff0000, 150);
      }
      textSize(50);
      text(x.getCost(), 145, 705);
    } 
    else if (x.getName().equals("Peashooter")) {
      fill(#e6dcc3);
      rect(275,625,200,100);
      fill(0, 100);
      textSize(22);
      text(x.getName(), 365, 655);
      image(peashooter, 245, 630);
      if (suns < x.getCost()) {
        fill(#ff0000, 150);
      }
      textSize(50);
      text(x.getCost(), 375, 705);
    } 
    else if (x.getName().equals("Wallnut")) {
      fill(#e6dcc3);
      rect(525,625,200,100);
      fill(0, 100);
      textSize(22);
      text(x.getName(), 635, 655);
      image(wallnut, 538, 630);
      if (suns < x.getCost()) {
        fill(#ff0000, 150);
      }
      textSize(50);
      text(x.getCost(), 635, 705);
    }
    else if (x.getName().equals("Ice")) {
      fill(#e6dcc3);
      rect(775,625,200,100);
      fill(0, 100);
      textSize(22);
      text(x.getName(), 895, 655);
      image(ice, 775, 630);
      if (suns < x.getCost()) {
        fill(#ff0000, 150);
      }
      textSize(50);
      text(x.getCost(), 900, 705);
    } 
  }
}

void mouseClicked() {
  if (mouseX > 25 && mouseX < 225 && mouseY > 625 && mouseY < 725) {
    if (suns >= menu[0].getCost() && menu[0].getCooldown() == 0) {
      select = true;
      selection = sunflower;
      followMouse(selection);
    }
    else {
      fill(#ff0000, 150);
      rect(25, 625, 200, 100);
    }
  } 
  else if (mouseX > 275 && mouseX < 475 && mouseY > 625 && mouseY < 725) {
    if (suns >= menu[1].getCost() && menu[1].getCooldown() == 0) {
      select = true;
      selection = peashooter;
      followMouse(selection);
    }
    else {
      fill(#ff0000, 150);
      rect(275, 625, 200, 100);
    }
  }  
  else if (mouseX > 525 && mouseX < 725 && mouseY > 625 && mouseY < 725) {
    if (suns >= menu[2].getCost() && menu[2].getCooldown() == 0) {
      select = true;
      selection = wallnut;
      followMouse(selection);
    }
    else {
      fill(#ff0000, 150);
      rect(525, 625, 200, 100);
    }
  }
  else if (mouseX > 775 && mouseX < 925 && mouseY > 625 && mouseY < 725) {
    if (suns >= menu[3].getCost() && menu[3].getCooldown() == 0) {
      select = true;
      selection = ice;
      followMouse(selection);
    }
    else {
      fill(#ff0000, 150);
      rect(775, 625, 200, 100);
    }
  }
}

void followMouse(PImage img) {
  if (mousePressed) {
    image(img, mouseX-50, mouseY-50);
  }
}

void mouseReleased() {
  if (select == true) {
    if (mouseX > 200 && mouseX < 1100 && mouseY > 100 && mouseY < 600) {
      int r = (mouseX-200)/100;
      int c = (mouseY-100)/100;
      if (plants[r][c] == null) {
        if (selection == sunflower) {
          plants[r][c] = new Sunflower(r,c);
          suns -= 50;
          menu[0].setSpecialCD();
        } else if (selection == peashooter) {
          plants[r][c] = new Peashooter(r,c);
          suns -= 100;
          menu[1].setCooldown();
        } else if (selection == wallnut) {
          plants[r][c] = new Wallnut(r,c);
          suns -= 100;
          menu[2].setCooldown();
        } else if (selection == ice) {
          plants[r][c] = new Ice(r,c);
          suns -= 0;
          menu[3].setCooldown();
        }
      }
    }
    select = false;
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

void randomZombieSpawn() {
  int x = (int)random(8);
  if (x == 0) {
    zombies.add(new Zombie(1200,100));
  }
  else if (x == 1) {
    zombies.add(new Zombie(1200,200));
  }
  else if (x == 2) {
    zombies.add(new Zombie(1200,300));
  }
  else if (x == 3) {
    zombies.add(new Zombie(1200,400));
  }
  else if (x == 4) {
    zombies.add(new Zombie(1200,500));
  }
  
}

void zombieMove() {
  for (Zombie z : zombies) {
    if (z.getFreeze() > 0) {
      if (getTick()%1 == 0) {
        z.setFreeze();
      }
    }
    else {
      int r = (int)((z.getX()-200)/100);
      int c = (int)((z.getY()-100)/100);
      if (r > -1 && r < 9 && c > -1 && c < 5 && plants[r][c] != null) {
        if (plants[r][c].getName().equals("Ice")) {
          plants[r][c].skill();
        }
        else {
          z.attack(plants[r][c]);
        }
        if (plants[r][c].getHP() == 0) {
          plants[r][c] = null;
        }
      }
      else if (getTick()%0.5 == 0) {
        z.setPos(move(z.getPos(), z.getVel(), "L"));
      }
    }
    z.display();
  }
}

void drawStart() {
  image(windows,0,0);
  stroke(#c9c9c9);
  fill(#e6e6e6);
  rect(345,105,10+(1200*0.6),20+(750*0.6), 10);
  image(load, 350, 120);
  image(ex, 1025,105);
  image(trash,20,30);
  image(ffox,20,100);
  image(val, 20, 170);
  image(file, 20, 240);
  image(file, 20, 310);
  image(pVz, 160, 170);
  image(mine, 90, 310);
  image(file, 160, 380);
  
  if (mousePressed && mouseX > 350 && mouseX < 350+(int)(1200*0.6) && mouseY > 120 && mouseY < 120+(int)(750*0.6)) {
    start = true;
  }
}

void cooldown() {
  for (int i = 0; i < menu.length; i++) {
    Entity x = menu[i];
    if (getTick()%1 == 0) {
      if (x.getCooldown() > 0) {
        x.minusCooldown();
      }
    }
    noStroke();
    fill(#807061,150);
    rect(25+250*i, 625, 200, 100*((float)(x.getCooldown())/x.getOGC()));
  }
}
