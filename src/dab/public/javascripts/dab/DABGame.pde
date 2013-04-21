class DABGame {
  Board board;
  Player player1;
  Player player2;
  Player playerTurn;  
  boolean tookSquare;
  boolean validMove;
  int mode;
  
  DABGame(int boardSize) {
    board = new Board(boardSize);
    tookSquare = false;  
    validMove = false;
    mode = 0;
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
  
  void setGameMode(int game_mode) {
    mode = game_mode;
  }
  
  int getGameMode() {
    return mode;  
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
    int game_mode = game.getGameMode();
    switch (game_mode) {
      case TWO_HUMAN_PLAYER_MODE:
        //do nothing, wait for mouse pressed
        break;
      case HUMAN_EASY_COMPUTER_PLAYER_MODE:
      case HUMAN_MEDIUM_COMPUTER_PLAYER_MODE:      
        if(playerTurn.getID().equals("player2")) 
            playerTurn.makeMove(board);
        break;
      
      case DEMO_MODE:
        playerTurn.makeMove(board);
        break;
        
      case GAME_OVER:
        return;
      
      default:
        break;    
    }
    
    board.displayGrid();
    board.displaySquares();  
    displayScores();
    if(isGameOver())
      endGame();
    else
      determinePlayersTurn();
  }
  
  void displayScores() {
    int player1_score = getScore(player1);
    int player2_score = getScore(player2);
    if(javascript != null) {
      javascript.showScores(player1_score, player2_score);
    }
  }
  
  void makeMove() {
    int game_mode = game.getGameMode();
    switch (game_mode) {
      case TWO_HUMAN_PLAYER_MODE:
        playerTurn.makeMove(board);
        break;
      case HUMAN_EASY_COMPUTER_PLAYER_MODE:
      case HUMAN_MEDIUM_COMPUTER_PLAYER_MODE:
        if(playerTurn.getID().equals("player1")) 
            playerTurn.makeMove(board);
        break;
      
      case DEMO_MODE:
        //do nothing
        break;
      
      default:
        break;    
    }    
  }
  
  void endGame() {
    setGameMode(GAME_OVER);
    int player1_score = getScore(player1);
    int player2_score = getScore(player2);
    if(javascript != null) {
      javascript.gameOver(player1_score, player2_score);
    }
  }
  
  boolean playerTookSquare() {
    return tookSquare;
  }
  
  boolean isGameOver() {
    return board.isSquaresTaken();  
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
