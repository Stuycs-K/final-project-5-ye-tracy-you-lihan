import java.util.*;

public class Game {
  private double tick;
  private int suns;
      /* ----- */
  private Entity[] menu;
  private Entity[][] plants;
  private ArrayList<Zombie> zombies;
  private ArrayList<Lawnmower> lawnmowers;
  private ArrayList<Sun> allSuns;
  private ArrayList<Pea> peas;
      /* ----- */
  private boolean select, start, pause, end;
  
  public Game() {
    tick = 0;
    suns = 75;
        /* ----- */
    menu = new Entity[4];
    menu[0] = new Sunflower();
    menu[1] = new Peashooter();
    menu[2] = new Wallnut();
    menu[3] = new Ice();
        /* ----- */
    plants = new Entity[9][5];
    zombies = new ArrayList<Zombie>();
    lawnmowers = new ArrayList<Lawnmower>();
    allSuns = new ArrayList<Sun>();
    peas = new ArrayList<Pea>();
        /* ----- */
    select = false;
    start = false;
    end = false;
    pause = false;
        /* ----- */
    for(int y = 100; y < 600; y += 100) {
      lawnmowers.add(new Lawnmower(120, y));
    }
  }
  
  public void run() {
   if (start == false) {
      drawStart();
    } 
    else if (end == true) {
      drawEnd();
    } 
    else if (pause) {
      //
    } 
    else {
      tick++;
      drawBackground();
      drawMenu();
      updateLawnmower();
      cooldown();
          /* ----- */
      displayPlants();
      randomSunDrop();
      collectSuns();
      randomSpawnZombie();
      zombieMove();
      activeLawnmower();
      selected();
      updatePeas();
      checkDeath();
    }
  }
  
  public void buyPlants() {
    if (mouseX > 25 && mouseX < 225 && mouseY > 625 && mouseY < 725) {
      if (suns >= menu[0].getCost() && menu[0].getCooldown() == 0) {
        select = true;
        selection = sunflower;
        followMouse(selection);
      } else {
        fill(#ff0000, 150);
        rect(25, 625, 200, 100);
      }
    } else if (mouseX > 275 && mouseX < 475 && mouseY > 625 && mouseY < 725) {
      if (suns >= menu[1].getCost() && menu[1].getCooldown() == 0) {
        select = true;
        selection = peashooter;
        followMouse(selection);
      } else {
        fill(#ff0000, 150);
        rect(275, 625, 200, 100);
      }
    } else if (mouseX > 525 && mouseX < 725 && mouseY > 625 && mouseY < 725) {
      if (suns >= menu[2].getCost() && menu[2].getCooldown() == 0) {
        select = true;
        selection = wallnut;
        followMouse(selection);
      } else {
        fill(#ff0000, 150);
        rect(525, 625, 200, 100);
      }
    } else if (mouseX > 775 && mouseX < 925 && mouseY > 625 && mouseY < 725) {
      if (suns >= menu[3].getCost() && menu[3].getCooldown() == 0) {
        select = true;
        selection = ice;
        followMouse(selection);
      } else {
        fill(#ff0000, 150);
        rect(775, 625, 200, 100);
      }
    }
  }
  
  public void placePlants() {
    if (select == true) {
      if (mouseX > 200 && mouseX < 1100 && mouseY > 100 && mouseY < 600) {
        int r = (mouseX-200)/100;
        int c = (mouseY-100)/100;
        if (plants[r][c] == null) {
          if (selection == sunflower) {
            plants[r][c] = new Sunflower(r,c, (int)getTick()%5);
            suns -= 50;
            menu[0].setSpecialCD();
          } else if (selection == peashooter) {
            plants[r][c] = new Peashooter(r,c, (int)getTick()%5);
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
  
  public PVector move(PVector position, PVector velocity, String dir) {
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
  
  // ------------------------------------------------------------------------- //
  // -------------------------- NO TOUCHIE ZONE ------------------------------ //
  // ------------------------------------------------------------------------- //
  
  private void drawStart() {
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
  
  private void drawBackground() {
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
  
  void drawMenu() {
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
  
  private void updateLawnmower() {
    for(int l = 0; l < lawnmowers.size(); l++) {
      if (lawnmowers.get(l).getActive()) {
        lawnmowers.get(l).skill(zombies);
      }
      lawnmowers.get(l).display();
      if(lawnmowers.get(l).getX() > 1200) {
        lawnmowers.remove(l);
      }
    }
  }
  
  private void cooldown() {
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
  
  private void displayPlants() {
    for (int i = 0; i < plants.length; i++) {
      for (int j = 0; j < plants[0].length; j++) {
        if (plants[i][j] != null) { 
          plants[i][j].display();
          if (!plants[i][j].getName().equals("Ice")) {
            plants[i][j].skill(zombies, allSuns, getTick());
          }
        }
      }
    }
  }
  
  private void randomSunDrop() {
    if (getTick()%10 == 0) {
      allSuns.add(new Sun((int)random(250,1000),0,0,5));
    }
  }
  
  private void collectSuns() {
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
  }
  
  private void randomSpawnZombie() {
    if (getTick()%4 == 0) {
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
  }
  
  private void zombieMove() {
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
          plants[r][c].skill(zombies, allSuns, getTick());
        }
        else {
          z.attack(plants[r][c], getTick());
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
  
  private void activeLawnmower() {
    for(int z = 0; z < zombies.size(); z++) {
      Zombie currZomb = zombies.get(z);
      if(currZomb.getX() < 220) {
        for (int l = 0; l < lawnmowers.size(); l++) {
          Lawnmower currLawn = lawnmowers.get(l);
          if (currLawn.getY() == currZomb.getY()) {
            currLawn.skill(zombies);
            currLawn.setActive(true);
          }
        }
      }
    }
  }
  
  private void selected() {
    if (select == true) {
      followMouse(selection);
    }
  }
  
  private void updatePeas() {
    for (int p = 0; p < peas.size(); p++) {
      Pea currPea = peas.get(p);
      int intialX = (int)currPea.pos.x;
      for (int z = 0; z < zombies.size(); z++) {
        Zombie currZomb = zombies.get(z);
        if (currZomb.pos.x > intialX && currZomb.pos.x-80 <= currPea.pos.x && currZomb.pos.y == currPea.pos.y) {
          peas.remove(p);
          currZomb.hp = currZomb.hp - currPea.getATK();
          if (currZomb.hp <= 0) {
            zombies.remove(z);
          }
        }
      }
      currPea.pos = move(currPea.pos, currPea.vel, "R");
      currPea.display();
    }
  }
  
  private void followMouse(PImage img) {
    if (mousePressed) {
      image(img, mouseX-50, mouseY-50);
    }
  }
  
  private double getTick() {
    return tick/60;
  }
  
  private void drawEnd() {
    image(endscreen, 0, 0);
    if (mousePressed) {
      if (mouseX > 357 && mouseX < 539 && mouseY > 642 && mouseY < 703) {
        setup();
        start = false;
        end = false;
      } 
      else if (mouseX > 665 && mouseX < 843 && mouseY > 635 && mouseY < 722) {
        setup();
        start = true;
        end = false;
      }
    }
  }
  
  private void checkDeath() {
    for (Zombie z : zombies) {
      if (z.pos.x < 50) end = true;
    }
  }
  
  private void checkKey() {
   if (key == 'p'){
     pause = !(pause);
   }
  }
  
  
  
  
}
