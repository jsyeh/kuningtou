//Chess chess;
Hexagon hexagon;
float map_dy=0;  // 利用 mouseDragged() 上下移動地圖
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

void mouseDragged(){
  map_dy += mouseY - pmouseY;
  if(map_dy > 0) map_dy=0;  // 地圖的長寬是916x1302，所以下面減掉高度
  if(map_dy < height - 1302) map_dy = height - 1302;
}

void mousePressed(){
  println(mouseX, mouseY);  // 印出座標，方便寫程式時，準確定位座標
}
