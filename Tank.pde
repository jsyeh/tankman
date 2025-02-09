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
}
