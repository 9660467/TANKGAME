class Obstacle {
  float x, y, w, h, speed, health;
  PImage object1;
  char idir;

  // Constucter
  Obstacle(float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = +100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y = -100;
    }
    w = 100;
    h = 100;

    object1 = loadImage("object.png");
    speed = 5;
    health = 3;
  }

  void display() {
    imageMode(CENTER);
    image(object1, x, y);
  }

  void move() {
    switch(idir) {
    case 'w':
      y = y - speed;
      break;
    case 'a' :
      x = x - speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd' :
      x = x + speed;
    }
  }

  boolean reachedEdge() {

    // Logic for when to return true

    return x >= width+100 || x<= -100 || y > height+100 || y < -100;
  }
}
