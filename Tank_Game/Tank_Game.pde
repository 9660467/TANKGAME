// Sebastian Pinon | 16 apr 26 | Tank Game
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;
Timer obsTimer;

void setup() {
  size(1000, 1000);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(25, 50));
  //obstacles.add(new Obstacle(50, 25));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  frameRate(60);
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank1.display();
  scorePanel();
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height)), 2, 10));
    obsTimer.start();
  }

  // Displaying Obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
    if (obs.reachedSide()) {
      obstacles.remove(i);
    }
  } // Displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if (p.reachedSide()) {
      projectiles.remove(i);
    }
  }
}

void scorePanel() {
  fill(#ef8733, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(127);
  textSize(33);
  text("Score:" + score, 50, 35);
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
