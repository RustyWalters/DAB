boolean overBox = false;
int lineWidth = 80;
int lineHeight = 5;
float lineX = 0.0;
float lineY = 0.0;
void setup() {
  size(800, 500);
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
    drawRow1();
    drawRow2();
    drawRow3();
    drawRow4();
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

void drawDot(float x, int y) {
  ellipse(x, y, 20, 20);
}  

void drawRect(float x, float y) {
  rect(x, y, lineWidth, lineHeight);
}

void drawLines() {
  lineX = width/2.8+10;
  lineY = 48;
  drawRect(lineX, lineY);
}

void drawRow1() {
  drawDot(width/2.8, 50);
  drawDot(width/2.8+100, 50);
  drawDot(width/2.8+200, 50);
  drawDot(width/2.8+300, 50);
}

void drawRow2() {
  drawDot(width/2.8, 150);
  drawDot(width/2.8+100, 150);
  drawDot(width/2.8+200, 150);
  drawDot(width/2.8+300, 150);
}

void drawRow3() {
  drawDot(width/2.8, 250);
  drawDot(width/2.8+100, 250);
  drawDot(width/2.8+200, 250);
  drawDot(width/2.8+300, 250);
}

void drawRow4() {
  drawDot(width/2.8, 350);
  drawDot(width/2.8+100, 350);
  drawDot(width/2.8+200, 350);
  drawDot(width/2.8+300, 350);
}

class Dot {
  float xpos;
  float ypos;
  int size;
  color dot_color; 
  Dot(color theColor, float theXpos, float theYpos, int size) {
  
  }  
}  

