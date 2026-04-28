class Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;

  // constucter
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 100;
    health = 100;
    iTankW = loadImage("tankW.png");
    iTankA = loadImage("tankA.png");
    iTankS = loadImage("tankS.png");
    iTankD = loadImage("tankD.png");
    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir == 'a') {
      image(iTankA, x, y);
    } else if (idir == 's') {
      image(iTankS, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  //void keyPressed() {
  //  if (key == 'w' ) {
  //    tank1.move('w');
  //  } else if (key == 's') {
  //    tank1.move('s');
  //  } else if (key == 'a') {
  //    tank1.move('a');
  //  } else if (key == 'd') {
  //    tank1.move('d');
  //  }
  //}
}
