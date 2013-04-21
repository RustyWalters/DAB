class DABComputerEasyStrategy extends DABStrategy {

  void makeMove(Board theBoard, Player playerTurn) {
    Square[] squares = theBoard.getSquares();
    Square square = null;
    square = findSquareOneLineAvailable(squares);
    if(square == null) {
      square = findSquareFirstLineAvailable(squares);
    }    
    if(square != null)
      selectLine(square, playerTurn);
  }
}
