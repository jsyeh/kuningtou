class Chess{
  int flag;  // 陣營 0:KMT, 1:CCP
  int no1;  // 師部番號
  int no2;  // 團部番號
  int type;  // 兵種 0:foot, 1:canon, 2: tank
  // 兵種：步砲裝，步營：1000人，砲連：50-250人，裝連：10戰車
  int fight;  // 戰鬥力
  int move;  // 移動力
  int coordI, coordJ;
  
  Chess(int _flag, int _type){
    flag = _flag;
    type = _type;
  }
  
  Chess(){
    
  }
  
  void draw(){
    int x=mouseX-30, y=mouseY-30;
    if(flag==0) fill(#C1CDE6);
    if(flag==1) fill(#F1BDCC);
    rect(x,y,30,30);

  }
}
