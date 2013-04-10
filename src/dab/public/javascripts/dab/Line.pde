class Line {
  Dot startDot;
  Dot endDot;
  color lineColor;
  float lineHeight;
  float xPos;
  float yPos;
  float lineLength;
  String direction;
  Player owner;
 
  Line(String theDirection, Dot theStartDot, Dot theEndDot, color theLineColor) {
    direction = theDirection;
    startDot = theStartDot;
    endDot = theEndDot;
    lineColor = theLineColor;
    owner = null;
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
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;  
  }
  
  float getLineLength() {
    return lineLength;
  }
  
  float getLineHeight() {
    return lineHeight;
  } 
   
  
  void checkLineAvailability(Player playerTurn) {
    if(hasOwner()) return;
      if(isSelected()) {
        lineColor = playerTurn.getColorCode();
    } else {
      lineColor = color(255,255,255);  
    }
  }    
 
  void makeMove(Player playerTurn) {
    if(hasOwner()) return;
    if(isSelected()) {
      setOwner(playerTurn);
        game.setValidMove(true);
    } else {
      lineColor = color(255,255,255);  
    }
  }    
  
  void setOwner(Player playerTurn) {
      lineColor = playerTurn.getColorCode();
      owner = playerTurn;
  }
  
  boolean isSelected() {
    if (mouseX > xPos && mouseX < xPos+lineLength &&
        mouseY > yPos && mouseY < yPos+lineHeight)
       return true;
    else
       return false; 
  }
  
  boolean hasOwner() {
    if(owner != null)
      return true;
    else
      return false;  
  }

  void drawLine() {
    fill(lineColor);
    rect(xPos, yPos, lineLength, lineHeight);   
  } 
}
