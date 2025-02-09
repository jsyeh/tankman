//int H = 12, W = 20, S = 50; // 小地圖，用手動註解切換
int H = 24, W = 40, S = 25; // 大地圖，用手動註解切換

int [] csv1D; // 會依照 H 的值，決定用哪個陣列：12用小地圖，24用大地圖
int [][] csv = new int[H][W];
PImage imgWall;
PImage [] imgGrass = new PImage[3];
PImage [][] imgMap = new PImage[H][W];
void setup() {
  size(1000,600);
  imgWall = loadImage("wall.png");
  for(int i=0; i<3; i++) imgGrass[i] = loadImage("grass_"+i+".png");
  
  if(H==12) csv1D = csv1_1;
  else csv1D = csv3_3;
  
  for(int i=0; i<H; i++) {
    for(int j=0; j<W; j++) {
      csv[i][j] = csv1D[i*W+j];
      imgMap[i][j] = imgGrass[int(random(3))];
    }
  }
}

void draw() {
  for(int i=0; i<H; i++) {
    for(int j=0; j<W; j++) {
      image(imgMap[i][j], j*S, i*S, S, S);
      if(csv[i][j] == 3) image(imgWall, j*S, i*S, S, S);
    }
  }
}
