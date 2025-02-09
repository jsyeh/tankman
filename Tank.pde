class Tank1 extends Tank {
  Tank1(int i, int j) {
    super(i,j);
    angle = 180;
  }
  void drawTank() {
    pushMatrix();
      translate(S/2,S/2);
      rotate(radians(angle-180));
      translate(-S/2,-S/2);
      image(imgTank1, 0, 0, S, S);    
    popMatrix();
  }
  boolean keepPressed = false;
  void update() {
    if(keyPressed && keyCode==UP) {
      forward();
    }else if(keyPressed && keyCode==DOWN) {
      backward();
    }else if(keyPressed && keyCode==RIGHT && keepPressed==false) {
      right();
      keepPressed = true;
    }else if(keyPressed && keyCode==LEFT && keepPressed==false) {
      left();
      keepPressed = true;
    }
    if(!keyPressed) keepPressed = false;
  }
}

class Tank2 extends Tank {
  Tank2(int i, int j) {
    super(i,j);
    angle = 0;
  }
  void drawTank() {
    pushMatrix();
      translate(S/2,S/2);
      rotate(radians(angle));
      translate(-S/2,-S/2);
      image(imgTank2, 0, 0, S, S);    
    popMatrix();
  }
  boolean keepPressed = false;
  void update() {
    if(keyPressed && (key=='W'||key=='w')) {
      forward();
    }else if(keyPressed && (key=='S'||key=='s')) {
      backward();
    }else if(keyPressed && (key=='D'||key=='d') && keepPressed==false) {
      right();
      keepPressed = true;
    }else if(keyPressed && (key=='A'||key=='a') && keepPressed==false) {
      left();
      keepPressed = true;
    }
    if(!keyPressed) keepPressed = false;
  }
}

class Tank {
  String id;
  int x, y, speed=8, score, power, oil, lives, angle=180, gun_angle=180, cooldown;
  Tank(int i, int j) { // 一開始的位置
    x = j*S;
    y = i*S; 
  }
  void draw() {
    pushMatrix();
      translate(x,y+50); // 避開上方的計時區
      drawTank();
    popMatrix();
  }
  void drawTank() {
    pushMatrix();
      translate(S/2,S/2);
      rotate(radians(angle-180));
      translate(-S/2,-S/2);
      rect(0, 0, S, S);
    popMatrix();
  }
  void forward() {
    x += cos(radians(angle))*speed;
    y += sin(radians(angle))*speed;    
  }
  void backward() {
    x -= cos(radians(angle))*speed;
    y -= sin(radians(angle))*speed;    
  }
  void right() {
    angle = (angle+45)%360;    
  }
  void left() {
    angle = (angle+315)%360;    
  }
  void update() {
    
  }
}
