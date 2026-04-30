class Projectile {
  float x, y, w, h, speed, health;
  // PImage projectile1;
  char idir;


  // Constructer
  Projectile(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 10;
    speed = 10;
  }

  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }


  Boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 10) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedEdge () {
    return x >= width+150 || x <= -150 || y <= width+150 || y >= width-150;
  }
}
