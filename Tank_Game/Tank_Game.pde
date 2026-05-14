// Sebastian Pinon | 16 apr 26 | Tank Game
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;

void setup() {
  size(1000, 1000);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  score = 0;
  obsTimer = new Timer(1500);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank1.display();
  scorePanel();

  // Distribute object on timer
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height)), 2, 10));
    obsTimer.start();
  }

  // Distribute powerups on a timer
  if (puTimer.isFinished()) {
    // Add PowerUp
    powerups.add(new PowerUp());
    // Restart Timer
    puTimer.start();
  }

  // Display and remove powerups
  for (int i = 0; i < powerups.size(); i ++) {
    PowerUp pu = powerups.get(i);
    //if (pu.reachedEdge()) {
    //  powerups.remove(pu);
    //}
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health+100;
        powerups.remove(pu);
      } else if (pu.type=='a') {
        tank1.ammo = tank1.ammo + 200000;
        powerups.remove(pu);
      } else if (pu.type=='t') {
        tank1.turretCount = tank1.turretCount + 1;
        powerups.remove(pu);
      }
    }
    pu.display();
    pu.move();
  }




  // Display and remove obsticles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
    if (obs.reachedEdge()) {
      obstacles.remove(i);
    }

    //detect collision to tank
    if (tank1.intersect(obs)) {
      tank1.health = tank1.health - 25;
      obstacles.remove(i);
    }
  }

  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle obs = obstacles.get(j);
      if (p.intersect(obs)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
  println("PowerUps in Memory:"+powerups.size());
}

void scorePanel() {
  fill(#ef8733, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(127);
  textSize(33);
  text("Score:" + tank1.score, width/2, 25);
  text("Health:"+ tank1.health, width/2-250, 25);
  text("Ammo:"+ tank1.ammo, width/2+250, 25);
}


//void keyPressed(char dir) {
//  if (key == 'w') {
//    tank1.move('w');
//  } else if (key == 's') {
//    tank1.move('s');
//  } else if (key == 'd') {
//    tank1.move('d');
//  } else if (key == 'a') {
//    tank1.move('a');
//  }
//}


void mousePressed() {
  if (tank1.turretCount == 1) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  } else if (tank1.turretCount == 2) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  } else if (tank1.turretCount == 3) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  } else if (tank1.turretCount == 4) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
  }
  projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
}

void keyPressed() {
  if (key == 'w' ) {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'a') {
    tank1.move('a');
  } else if (key == 'd') {
    tank1.move('d');
  }
}
