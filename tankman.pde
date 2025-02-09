PImage imgWall;
void setup() {
  size(1000,600);
  imgWall = loadImage("wall.png");
}
void draw() {
  for(int i=0; i<12; i++) {
    for(int j=0; j<20; j++) {
      image(imgWall, j*50, i*50);
    }
  }
}
