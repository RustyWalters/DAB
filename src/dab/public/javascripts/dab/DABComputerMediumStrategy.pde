class DABComputerMediumStrategy extends DABStrategy {

  Square findSquareWithLinesAvailable(Square[] squares, int linesAvailable) {
    Square square = null;
    for(int i = 0; i < squares.length; i++) {
      if( !squares[i].isOwned()) {
        if(squares[i].getNbrLinesAvailable() == linesAvailable) {
          square = squares[i];
          break;    
        } 
      }
    }
    return square;    
  }


  void makeMove(Board theBoard, Player playerTurn) {
    Square[] squares = theBoard.getSquares();
    Square square = null;
    square = findSquareOneLineAvailable(squares);
    if(square == null) {
      square = findSquareWithLinesAvailable(squares,4);
    }
    if(square == null) {
      square = findSquareWithLinesAvailable(squares,3);
    }
    if(square == null) {
      square = findSquareWithLinesAvailable(squares,2);
    }
    if(square == null) {
      square = findSquareFirstLineAvailable(squares);
    }
    if(square != null)
      selectLine(square, playerTurn);
  }
}
