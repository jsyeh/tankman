//int H = 12, W = 20, S = 50; // 小地圖，用手動註解切換
int H = 24, W = 40, S = 25; // 大地圖，用手動註解切換

int [] csv1D; // 會依照 H 的值，決定用哪個陣列：12用小地圖，24用大地圖
int [][] csv = new int[H+1][W]; // 下方多一行亂數的草地
PImage [] imgHour = new PImage[15];
PImage imgTank1, imgTank2, imgWall, imgBullets, imgOil;
PImage [] imgGrass = new PImage[3];
PImage [][] imgMap = new PImage[H+1][W]; // 下方多一行亂數的草地
int teamScore1, teamScore2;

void setup() {
  size(1000,700);
  noStroke();
  textFont(createFont("Arial-BoldMT",23));
  for(int i=0; i<15; i++) imgHour[i] = loadImage("hourglass_"+i+".png");
  imgTank1 = loadImage("1P.png");
  imgTank2 = loadImage("2P.png");
  imgWall = loadImage("wall.png");
  imgBullets = loadImage("bullets.png");
  imgOil = loadImage("oil.png");
  for(int i=0; i<3; i++) imgGrass[i] = loadImage("grass_"+i+".png");
  
  if(H==12) csv1D = csv1_1;
  else csv1D = csv3_3;
  
  for(int i=0; i<H; i++) {
    for(int j=0; j<W; j++) {
      csv[i][j] = csv1D[i*W+j];
      imgMap[i][j] = imgGrass[int(random(3))];
    }
  }
  for(int j=0; j<W; j++) imgMap[H][j] = imgGrass[int(random(3))];
}

void draw() {
  background(255);
  fill(#FFFF91);
  rect(0,0,1000,50);
  image(imgHour[(frameCount/10)%15], 0, 0, 25, 25);
  fill(255,0,0);
  textSize(25);
  text("Frame: "+((1000-frameCount)+1000)%1000, 836, 25);
  for(int i=0; i<H+1; i++) {
    for(int j=0; j<W; j++) {
      image(imgMap[i][j], j*S, 50+i*S, S, S);
      if(csv[i][j] == 1) image(imgTank1, j*S, 50+i*S, S, S);
      if(csv[i][j] == 2) image(imgTank2, j*S, 50+i*S, S, S);
      if(csv[i][j] == 3) image(imgWall, j*S, 50+i*S, S, S);
      if(csv[i][j] == 4) image(imgBullets, j*S, 50+i*S, S, S);
      if(csv[i][j] == 5) image(imgOil, j*S, 50+i*S, S, S);
    }
  }
  fill(#5F90F7, 128);
  rect(0,650,500,100);
  fill(#72F720, 128);
  rect(500,650,500,100);
  
  fill(0,0,255);
  text("Score: " + teamScore1, 3, 682);
  fill(#3D7425);
  text("Score: " + teamScore2, 875, 682);
}
