    void setup() {
  size(800, 500);
}

void draw() {
    fill(0);
    drawRow1();
    drawRow2();
    drawRow3();
    drawRow4();
}

void drawDot(float x, int y) {
  ellipse(x, y, 20, 20);
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
