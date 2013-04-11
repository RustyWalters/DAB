class Square {
  HashMap<String,Line> lines;
  Player owner;
  float xPos;
  float yPos;
  float squareLength;
  float squareHeight;
  color fillColor;
  
  Square(HashMap<String,Line> theLines) {
    lines = theLines;
    setDimensions();  
  }
  
  Line getLine(String theKey) {
    return lines.get(theKey);  
  }
  
  void setDimensions() {
    Line top = lines.get(TOP);
    Line right = lines.get(RIGHT);
    Line bottom = lines.get(BOTTOM);
    xPos = top.getXPos();
    yPos = top.getYPos() + top.getLineHeight();  
    squareLength = top.getLineLength() + right.getLineLength() - 2.2;
    squareHeight = bottom.getYPos() - top.getYPos() - bottom.getLineHeight();
  }
  
  void drawSquare() {
    for (Line ln: lines.values()){
      ln.drawLine();  
    }
    if(isOwned())
      fillSquare();
  }  

  void makeMove(Player playerTurn) {
      for(Line ln: lines.values()) {
        ln.makeMove(playerTurn);  
      }
      if(allLinesOwned()) {
        setOwner(playerTurn);  
        game.setTookSquare(true);
      }      
  } 
 
  boolean allLinesOwned() {
    boolean isOwned = true;
      for(Line ln: lines.values()) {
        if(ln.hasOwner())
          continue;  
        else {
         isOwned = false;
         break;  
       }
    } 
    return isOwned; 
  } 
  
  void checkLineAvailability(Player playerTurn) {
      for(Line ln: lines.values()) {
        ln.checkLineAvailability(playerTurn);
      }
  }
  
  boolean isOwned() {
    if(owner != null)
      return true;
    else
      return false;  
  }
  
  void setOwner(Player theOwner) {
    owner = theOwner;  
    fillColor = owner.getColorCode();
  }
  
  Player getOwner() {
    return owner;  
  }
  
  void fillSquare() {
    fill(fillColor);
    rect(xPos, yPos, squareLength, squareHeight);   
  }
}  
