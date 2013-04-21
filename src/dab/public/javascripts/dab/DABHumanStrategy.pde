class DABHumanStrategy extends DABStrategy {

  void makeMove(Board theBoard, Player playerTurn) {
    Square[] squares = theBoard.getSquares();
    for(int i = 0; i < squares.length; i++) {
      if( !squares[i].isOwned()) {
        HashMap<String,Line> lines;
        lines = squares[i].getLines();
        for(Line ln: lines.values()) {
          if(ln.hasOwner()) continue;
          if(ln.isSelected()) {
            ln.setOwner(playerTurn);
            game.setValidMove(true);
          } else {
            ln.setLineColor(color(255,255,255));  
          }
        }
        if(squares[i].allLinesOwned()) {
          squares[i].setOwner(playerTurn);  
          game.setTookSquare(true);
        }      
      }
    } 
  }
}
