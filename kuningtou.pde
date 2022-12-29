Hexagon hexagon = null;;
Chess selectedChess = null;
float map_dx = 0, map_dy = 0;  // 利用 mouseDragged() 上下左右移動/捲動地圖
float map_scale = 1;  // 縮放比例，利用 mouseWheel() 或 兩指移動 來縮放地圖
float map_cx = 0, map_cy = 0;  // 縮放時的中心點，在縮放時保持在中心
PImage img;

void setup(){
  size(916,720);
  img = loadImage("kuningtou.jpeg");
  hexagon = new Hexagon();
  buildAllChess();
}

void draw(){
  image(img, map_dx, map_dy, img.width * map_scale, img.height * map_scale);
  
  pushMatrix();
    translate(map_dx, map_dy);
    scale(map_scale);
    hexagon.draw();
  popMatrix();
  
  selectedChess = null;
  for (int i=0; i < allChess.size(); i++) {
    Chess c = allChess.get(i);
    c.draw();
    if (c.inside(mouseX, mouseY)) {
      c.drawRed();  // 畫紅色，確認有順利找到mouse摸到的棋子
      selectedChess = c;
    }
  }
}

int mouseWheel_delta = 0;
int mouseWheel_T = 0;
void mouseWheel(MouseEvent event) {
  int count = event.getCount();
  
  // 因 Mac 觸控板雙指 scrolling 對應的 mouseWeel() 有點怪，用 platform 來分開處理
  if(platform == MACOS) {  // 用 platform 來決定 mouseWheel 的行為
    if(millis() - mouseWheel_T > 100) {
      mouseWheel_T = millis();
      mouseWheel_delta = 0;  //滑比較慢 or 手放開時，歸零
    }
    mouseWheel_delta += count;
  } else {
    mouseWheel_delta = count*3;
  }
  
  map_cx = (mouseX - map_dx) / map_scale;
  map_cy = (mouseY - map_dy) / map_scale;
  map_scale *= pow(1.01, mouseWheel_delta);
  if(map_scale < 1) map_scale = 1;  // 限制不能太小，畫面才好看
  
  map_dx = mouseX - map_cx * map_scale;
  map_dy = mouseY - map_cy * map_scale;
}

void mouseDragged() {
  if (selectedChess != null) {// 如果有選到棋子時，就移動棋子
    selectedChess.setPosPlus(mouseX - pmouseX, mouseY - pmouseY);
  } else {// 如果沒有在棋子的上法，就平移地圖
    map_dx += mouseX - pmouseX;
    map_dy += mouseY - pmouseY;
    if (map_dx > 0) map_dx = 0;  // 平移時，確保地圖的邊緣不越過在畫面的邊緣
    if (map_dy > 0) map_dy = 0;  // 平移時，確保地圖的邊緣不越過在畫面的邊緣
    // 地圖的長寬是916x1302
    if (map_dx < width - 916*map_scale) map_dx = width - 916*map_scale;
    if (map_dy < height - 1302*map_scale) map_dy = height - 1302*map_scale;
  }
}

void mousePressed(){
  println(mouseX, mouseY);  // 印出座標，方便寫程式時，準確定位座標
}
