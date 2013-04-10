interface JavaScript {
  void showScores(int p1Score, int p2Score);
}
 
void bindJavascript(JavaScript js) {
  javascript = js;
}
 
JavaScript javascript;


class DABGame {
  Board board;
  Player player1;
  Player player2;
  Player playerTurn;  
  boolean tookSquare;
  boolean validMove;
  
  DABGame(int boardSize) {
    board = new Board(boardSize);
    tookSquare = false;  
    validMove = false;
  }

  void setPlayer(int playerNbr, Player thePlayer) {
    switch (playerNbr) {
      case 1:
        player1 = thePlayer;
        break;
      case 2:
        player2 = thePlayer;
        break;
      default:
        break;
    }  
    playerTurn = player1;
  }  
  
  int  getScore(Player player) {
    return board.getScore(player);
  }

  void nextPlayersTurn() {
    if(playerTurn==player1)
       playerTurn = player2;
    else 
       playerTurn = player1;
  }
  
  void play() {
    fill(0);
    board.checkLineAvailability(playerTurn);
    board.displayGrid();
    board.displaySquares();
    displayScores();
  }
  
  void displayScores() {
    int player1_score = getScore(player1);
    int player2_score = getScore(player2);
//    System.out.println("Player1 score: " + player1_score);  
//    System.out.println("Player2 score: " + player2_score);
    if(javascript != null) {
      javascript.showScores(player1_score, player2_score);
    }
  }
  
  void makeMove() {
    board.makeMove(playerTurn);
    determinePlayersTurn();   
//    displayScores();
  }
  
  boolean playerTookSquare() {
    return tookSquare;
  }
  
  boolean isValidMove() {
    return validMove;  
  }
  
  void setValidMove(boolean flag) {
    validMove = flag;
  }
  
  void setTookSquare(boolean theFlag) {
    tookSquare = theFlag;
  }
  
  void determinePlayersTurn() {
    if(isValidMove() && playerTookSquare()) {
      setTookSquare(false);  //player gets to take another turn
      setValidMove(false);
    } else {
      if(isValidMove()) {      
        setValidMove(false);  //reset for the next move; otherwise same players turn
        nextPlayersTurn();
      }      
    }  
  }
}  
