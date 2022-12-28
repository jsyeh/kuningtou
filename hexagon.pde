class Hexagon {
  int coordI;
  int coordJ;
  
  void draw() {
    for(int i=0; i<15; i++){
      for(int j=0; j<14; j++){
        if(grid[i][j]==1) drawOne(i,j);
      }
    }
  }
  
  void drawOne(int ii, int jj) {
    float R=39.51, r=37;
    //58,235,  97,234,
    //             114,269
    //float x = 78, y = 269;
    float x = 78 + jj*R*1.5; 
    float y = 269 + ii*(R*sqrt(3));
    if(jj%2==1) y += R*sqrt(3)/2;
    ellipse( 77, 269, 3, 3);
    stroke(200);
    fill(255,68);
    beginShape();
    for(int i=0; i<6; i++){
      vertex(x + cos(PI*2*i/6)*r, y + sin(PI*2*i/6)*r);
    }
    endShape(CLOSE);
  }
}

int [][] grid = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0},  
};
