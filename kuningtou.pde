//Chess chess;
Hexagon hexagon;
float map_dy=0;  // 利用 mouseDragged() mouseWheel() 上下捲動地圖
PImage img;

void setup(){
  size(916,850);
  img = loadImage("kuningtou.jpeg");
  hexagon = new Hexagon();
  //chess = new Chess();
}

void draw(){
  image(img, 0, map_dy);
  translate(0, map_dy);
  hexagon.draw();
  //chess.draw();
}

int mouseWheel_dy = 0;
int mouseWheel_T = 0;
void mouseWheel(MouseEvent event) {
  int count = event.getCount();
  
  // 因 Mac 觸控板雙指 scrolling 對應的 mouseWeel() 有點怪，用 platform 來分開處理
  if(platform == MACOS) {  // 用 platform 來決定 mouseWheel 的行為
    if(millis() - mouseWheel_T > 100) {
      mouseWheel_T = millis();
      mouseWheel_dy = 0;  //滑比較慢 or 手放開時，歸零
    }
    mouseWheel_dy += count;
    map_dy -= mouseWheel_dy;
  } else {
    map_dy += count;
  }
  
  if(map_dy > 0) map_dy=0;  // 地圖的長寬是916x1302，所以下面減掉高度
  if(map_dy < height - 1302) map_dy = height - 1302;
}

void mouseDragged(){
  map_dy += mouseY - pmouseY;
  if(map_dy > 0) map_dy=0;  // 地圖的長寬是916x1302，所以下面減掉高度
  if(map_dy < height - 1302) map_dy = height - 1302;
}

void mousePressed(){
  println(mouseX, mouseY);  // 印出座標，方便寫程式時，準確定位座標
}
