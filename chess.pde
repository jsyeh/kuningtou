class Chess{
  int type;  // 棋的類型 1:回合棋 2:指揮棋 3:戰術棋 4:戰鬥棋
  float x, y;  // 在地圖上的座標
  float w = 34.845, h = 34.845;
  
  void setPos(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void setPosPlus(float dx, float dy) {
    // dx, dy 在視窗座標系統，要轉到地圖座標系統 的比例
    float dx2 = (dx) / map_scale;
    float dy2 = (dy) / map_scale;
    x += dx2;
    y += dy2;
  }
  
  boolean inside(float x2, float y2) {
    // (x2, y2) 在視窗座標系統, 要轉到地圖座標系統
    // (x, y) 在地圖座標系統
    float x3 = (x2 - map_dx) / map_scale;
    float y3 = (y2 - map_dy) / map_scale;
    if (x < x3 && x3 < x + w && y < y3 && y3 < y + h) return true;
    else return false;
  }
  
  void draw() {
    draw(x, y);
  }
  
  void draw(float x, float y) {  // 在地圖世界的位移量，單位 pixel
    
  }
  
  void drawRed() {  // 暫時的程式，畫紅色，確認有順利找到mouse摸到的棋子
    pushMatrix();
      translate(x * map_scale + map_dx, y * map_scale + map_dy);
      fill(255, 0, 0, 128);
      rect(0, 0, 34 * map_scale, 34 * map_scale);
    popMatrix();
  }
}

class Chess1Round extends Chess {
  
}

class Chess2Command extends Chess {
  
}

class Chess3Special extends Chess {
  
}

class Chess4Unit extends Chess {
  int flag;  // 陣營 0:KMT, 1:CCP
  String no1;  // 師部番號
  String no2;  // 團部番號
  int unit_type;  // 兵種 0:foot, 1:canon, 2: tank
  // 兵種：步砲裝，步營：1000人，砲連：50-250人，裝連：10戰車
  int combat;  // 戰鬥力
  int movement;  // 移動力
  int coordI, coordJ;
  
  Chess4Unit(int _flag, String _no1, String _no2, int _unit_type, int _combat, int _movement) {
    type = 4;
    flag = _flag;
    no1 = _no1;
    no2 = _no2;
    unit_type = _unit_type;
    combat = _combat;
    movement = _movement;
  }
  
  Chess4Unit() {
    this(0, "11", "31R", 0, 4, 5);
  }
    
  void draw(float x, float y) {
    textAlign(CENTER, CENTER);
    pushMatrix();
      translate(x * map_scale + map_dx, y * map_scale + map_dy);
      if(flag == 0) fill(#A1ABE6);  // KMT
      if(flag == 1) fill(#F1BDCC);  // CCP
      rect(0, 0, 34 * map_scale, 34 * map_scale);
      // 棋子的長寬是 14.3cm/9=15.88mm, 雜誌寫 5/8吋=15.8750mm
      // 六角邊長18mm=39.51px, 所以棋子邊長為 39.51/18*15.875=34.845
      // 也就是：六邊形的高, 可放2個棋子
      fill( bannerColor(no1) );
      rect(4 * map_scale, 4 * map_scale, 26 * map_scale, 8 * map_scale);
      fill(255);
      textSize(8*map_scale);
      text(no1, 34/2 * map_scale, (4+8/2-1) * map_scale);
      
      fill(0);
      pushMatrix();
        translate(30 * map_scale, 17 * map_scale);
        rotate(radians(90));
        textSize(5 * map_scale);
        text(no2, 0, 0);
      popMatrix();
      textSize(12 * map_scale);
      text(combat + "-" + movement, 17 * map_scale, 25 * map_scale);
    popMatrix();
  }
  
  color bannerColor(String no) {
    if(no == "11") return #7C8B29;
    if(no == "13") return #220D42;
    if(no == "14") return #65294A;
    if(no == "18") return #88213C;
    if(no == "40") return #4C4532;
    if(no == "118") return #406E1D;
    if(no == "戰3") return #2E3007;
    if(no == "201") return #587997;
    
    if(no == "28") return #882712;
    if(no == "29") return #882712;
    if(no == "82") return #B54F2D;
    if(no == "84") return #B54F2D;
    if(no == "85") return #EAB43D;
    if(no == "87") return #64210E;
    return #FF0000;
  }
}

ArrayList<Chess> allChess;
void buildAllChess() {
  allChess = new ArrayList<Chess>();
  allChess.add(new Chess4Unit(0, "11", "31R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "11", "31R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "11", "   ", 1, 1, 4) );
  allChess.add(new Chess4Unit(0, "13", "39R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "13", "39R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "14", "41R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "14", "42R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "18", "52R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "18", "54R", 0, 3, 5) );
  
  allChess.add(new Chess4Unit(0, "40", "118R\n119R", 0, 3, 5) );
  allChess.add(new Chess4Unit(0, "118", "352R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "352R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "353R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "353R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "354R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "354R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "118", "    ", 1, 1, 4) );
  allChess.add(new Chess4Unit(0, "118", "    ", 1, 1, 4) );

  allChess.add(new Chess4Unit(0, "118", "    ", 1, 1, 4) );
  allChess.add(new Chess4Unit(0, "戰3", "1B", 2, 7, 6) );
  allChess.add(new Chess4Unit(0, "戰3", "1B", 2, 7, 6) );
  allChess.add(new Chess4Unit(0, "201", "601R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "201", "601R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "201", "602R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "201", "602R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "201", "    ", 1, 1, 4) );
  allChess.add(new Chess4Unit(0, "201", "    ", 1, 1, 4) );


  allChess.add(new Chess4Unit(0, "82", "244R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "82", "244R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "82", "244R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "82", "246R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "82", "246R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "82", "    ", 1, 3, 4) );
  allChess.add(new Chess4Unit(0, "84", "251R", 0, 6, 5) );

  allChess.add(new Chess4Unit(0, "84", "251R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "84", "251R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "84", "    ", 1, 3, 4) );
  allChess.add(new Chess4Unit(0, "85", "253R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "85", "253R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "85", "253R", 0, 6, 5) );
  allChess.add(new Chess4Unit(0, "85", "    ", 1, 3, 4) );
  allChess.add(new Chess4Unit(0, "87", "259R", 0, 4, 5) );
  allChess.add(new Chess4Unit(0, "87", "259R", 0, 4, 5) );

  for (int i=0; i < allChess.size(); i++) {
    Chess c = allChess.get(i);
    c.setPos(80 + (i%9)*36, 220 + int(i/9)*36);
  }
}
