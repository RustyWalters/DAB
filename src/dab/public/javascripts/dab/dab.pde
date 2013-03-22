boolean overBox = false;
int lineWidth = 50;
int lineHeight = 5;
float lineX = 100.0;
float lineY = 100.0;
String HORIZONTAL = "HORIZONTAL";
String VERTICAL = "VERTICAL";

Board board;

void setup() {
  size(900, 500);
  board = new Board(3);
}

void draw() {
  if (mouseX > lineX-lineWidth && mouseX < lineX+lineWidth &&
    mouseY > lineY-lineHeight && mouseY < lineY+lineHeight) {
    overBox = true;
    fill(0, 255, 0);
//    drawLines();
  } 
  else {
    overBox = false;
    fill(0);
    board.displayGrid();
    board.displayLines();
  }
}

//void mousePressed() {
// if(overBox) {
//   fill(255, 0,0);
//   drawLines();
// } 
//}


class Dot {
  float xpos;
  float ypos;
  int size;
  color dot_color; 
  Dot(color theColor, float theXpos, float theYpos, int theSize) {
    dot_color = theColor;
    xpos = theXpos;
    ypos = theYpos;
    size = theSize;
  }  
  
  float getXPos() {
    return xpos;
  }
  
  float getYPos() {
    return ypos;
  }
  
  int getSize() {
    return size;
  }

  void drawDot() {
    fill(dot_color);
    ellipse(xpos, ypos, size, size);
  }  
}  

class Board {
  int gridSize;
  Dot[][] grid;
  Line[] lines;
  int dotSize = 20;
  color dotColor = color(0, 0, 0);  
  float yStartPos = 50.0;
  float xStartPos = width/2.8;

  Board(int theGridSize) {
    gridSize = theGridSize+1; //adding one to get the number of rows and columns requested, rather than just the number of dots -- misleading
    buildGrid();
    buildLines();
  } 
  
  void buildGrid() {
    grid = new Dot[gridSize][gridSize];
    for(int i = 0; i < gridSize; i++) {
      for(int j = 0; j < gridSize; j++) {
        grid[i][j] = new Dot(dotColor, xStartPos + (j*100), yStartPos + (i*100), dotSize); 
        
      }
    }   
  }
  
  void buildLines() {
    lines = new Line[7];
    //square 1
    lines[0] = new Line(HORIZONTAL, grid[0][0], grid[0][1], color(255,255,255)); 
    lines[1] = new Line(VERTICAL, grid[0][1], grid[1][1], color(255,255,255));  //shared vertical line
    lines[2] = new Line(VERTICAL, grid[0][0], grid[1][0], color(255,255,255));
    lines[3] = new Line(HORIZONTAL, grid[1][0], grid[1][1], color(255,255,255));    

    //square 2
    lines[4] = new Line(HORIZONTAL, grid[0][1], grid[0][2], color(255,255,255));
    lines[5] = new Line(HORIZONTAL, grid[1][1], grid[1][2], color(255,255,255));
    lines[6] = new Line(VERTICAL, grid[0][2], grid[1][2], color(255,255,255));
  }

  void displayGrid() {
    for(int i = 0; i < gridSize; i++) {
      for(int j = 0; j < gridSize; j++) {
        grid[i][j].drawDot(); 
      }
    }   
  }

  void displayLines() {
    for(int i = 0; i < lines.length; i++) {
      lines[i].drawLine();
    }
  }  
}

class Line {
  Dot startDot;
  Dot endDot;
  color lineColor;
  float lineHeight;
  float xPos;
  float yPos;
  float lineLength;
  String direction;
 
  Line(String theDirection, Dot theStartDot, Dot theEndDot, color theLineColor) {
    direction = theDirection;
    startDot = theStartDot;
    endDot = theEndDot;
    lineColor = theLineColor;
    if(direction == HORIZONTAL) {
      lineHeight = 5;
      lineLength = (endDot.getXPos() - startDot.getXPos()) - startDot.getSize();
      xPos = startDot.getXPos()+startDot.getSize()/2;
      yPos = startDot.getYPos()-lineHeight/2;
    } else {
      lineLength = 5;
      lineHeight = (endDot.getYPos() - startDot.getYPos()) - startDot.getSize();
      xPos = startDot.getXPos()-startDot.getSize()/6;
      yPos = startDot.getYPos()+startDot.getSize()/2;
    }      
  }
 
  void drawLine() {
    fill(lineColor);
    rect(xPos, yPos, lineLength, lineHeight);   
  } 
}
