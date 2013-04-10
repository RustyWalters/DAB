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