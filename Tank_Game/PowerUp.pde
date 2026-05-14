class PowerUp {
  float x, y, w, h, speed;
  char type;


  // Constucter
  PowerUp() {
    w = 100;
    h = 100;
    speed = 5;
    x = random(width);
    y = -50;
    if (int(random(4))==2) {
      type = 'h'; // Health
    } else if (random(3)==1) {
      type = 't'; // Turret
    } else {
      type = 'a'; //Ammo
    }
  }

  void display() {
    if (type == 'a' ) {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    } else if (type == 'h' ) {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Health", x, y);
    } else {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Turret", x, y);
    }
  }

  void move() {
    y = y + speed;
  }
  boolean reachedEdge () {
        return (y < -10 || y > height + 10 || x < -10 || x > width + 10);
  }

  boolean intersect (Tank t) {
    float distance = dist(x, y, t.x, t.y);
      if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
