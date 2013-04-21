abstract class DABStrategy {
  abstract protected void makeMove(Board theBoard, Player thePlayer);  
  
  protected Square findSquareOneLineAvailable(Square[] squares) {
    Square square = null;
    for(int i = 0; i < squares.length; i++) {
      if( !squares[i].isOwned()) {
        if(squares[i].getNbrLinesAvailable() == 1) {
          square = squares[i];    
          break;
        } 
      }
    }
    return square;
  }  
  
  Square findSquareFirstLineAvailable(Square[] squares) {
    Square square = null;
    for(int i = 0; i < squares.length; i++) {
      if( !squares[i].isOwned()) {
        if(squares[i].getNbrLinesAvailable() >= 1) {
          square = squares[i];
          break;    
        } 
      }
    }
    return square;    
  }  
  
  protected void selectLine(Square square, Player playerTurn) {
    HashMap<String,Line> lines;
    lines = square.getLines();
    for(Line ln: lines.values()) {
      if(ln.hasOwner()) continue;
      ln.setOwner(playerTurn);
      game.setValidMove(true);
      break;
    }
    if(square.allLinesOwned()) {
      square.setOwner(playerTurn);  
      game.setTookSquare(true);
    }      
  }
  
}
