boolean overBox = false;
int lineWidth = 80;
int lineHeight = 5;
float lineX = 100.0;
float lineY = 100.0;
color dotColor = color(0, 0, 0);  
Dot[] row1 = new Dot[4];
Dot[] row2 = new Dot[4];
Dot[] row3 = new Dot[4];
Dot[] row4 = new Dot[4];

void setup() {
  size(800, 500);
  setupRow1();
  setupRow2();
  setupRow3();
  setupRow4();
}

void setupRow1() {
  row1[0] = new Dot(dotColor, width/2.8, 50, 20); 
  row1[1] = new Dot(dotColor, width/2.8+100, 50, 20);
  row1[2] = new Dot(dotColor, width/2.8+200, 50, 20);
  row1[3] = new Dot(dotColor, width/2.8+300, 50, 20);
}

void setupRow2() {
  row2[0] = new Dot(dotColor, width/2.8, 150, 20); 
  row2[1] = new Dot(dotColor, width/2.8+100, 150, 20);
  row2[2] = new Dot(dotColor, width/2.8+200, 150, 20);
  row2[3] = new Dot(dotColor, width/2.8+300, 150, 20);
}

void setupRow3() {
  row3[0] = new Dot(dotColor, width/2.8, 250, 20); 
  row3[1] = new Dot(dotColor, width/2.8+100, 250, 20);
  row3[2] = new Dot(dotColor, width/2.8+200, 250, 20);
  row3[3] = new Dot(dotColor, width/2.8+300, 250, 20);
}

void setupRow4() {
  row4[0] = new Dot(dotColor, width/2.8, 350, 20); 
  row4[1] = new Dot(dotColor, width/2.8+100, 350, 20);
  row4[2] = new Dot(dotColor, width/2.8+200, 350, 20);
  row4[3] = new Dot(dotColor, width/2.8+300, 350, 20);
}

void draw() {
  if (mouseX > lineX-lineWidth && mouseX < lineX+lineWidth &&
    mouseY > lineY-lineHeight && mouseY < lineY+lineHeight) {
    overBox = true;
    fill(0, 255, 0);
    drawLines();
  } 
  else {
    overBox = false;
    fill(0);
    drawRow(row1);
    drawRow(row2);
    drawRow(row3);
    drawRow(row4);
    fill(255);
    drawLines();
  }
}

void mousePressed() {
 if(overBox) {
   fill(255, 0,0);
   drawLines();
 } 
}

void drawRect(float x, float y) {
  rect(x, y, lineWidth, lineHeight);
}

void drawLines() {
  lineX = width/2.8+10;
  lineY = 48;
  drawRect(lineX, lineY);
}

void drawRow(Dot[] row) {
  for(int i = 0; i < row.length; i++) {
    row[i].drawDot(); 
  }
}


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
  
  void drawDot() {
    fill(dot_color);
    ellipse(xpos, ypos, size, size);
  }  
}  


