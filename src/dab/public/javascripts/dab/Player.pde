class Player {
  color colorCode;
  String identifier;
  DABStrategy strategy;

  Player(color theColor, String ID, DABStrategy theStrategy) {
    colorCode = theColor;
    identifier = ID;
    strategy = theStrategy;
  }  
  
  String getID() {
    return identifier;
  }
  
  color getColorCode() {
    return colorCode;
  }
  
  void makeMove(Board game_board) {
    strategy.makeMove(game_board, this);
  }
}  
