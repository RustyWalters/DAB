class Player {
  color colorCode;
  String identifier;

  Player(color theColor, String ID) {
    colorCode = theColor;
    identifier = ID;
  }  
  
  String getID() {
    return identifier;
  }
  
  color getColorCode() {
    return colorCode;
  }
}  
