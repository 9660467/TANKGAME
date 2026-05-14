class Projectile {
  float x, y, w, h, speed;
  PImage proj;
  char idir;

  
  // Constructer
  Projectile(int x, int y) {
    this.x = x;
    this.y = y;
    this.proj = loadImage("projectile.png");
    w = 10;
    h = 10;
    speed = 5;
  }

  void display() {
    image(proj, x, y, w, h);
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
    return (y < -10 || y > height + 10 || x < -10 || x > width + 10);
  }
}
