class Board {
  int gridSize;
  Dot[][] grid;
  HashMap lines;
  Square[] squares;
  int dotSize = 10;
  color dotColor = color(0, 0, 0);  
  float yStartPos = 50.0;
  float xStartPos = width/2.8;

  Board(int theGridSize) {
    gridSize = theGridSize+1; //adding one to get the number of rows and columns requested, rather than just the number of dots -- misleading
    buildGrid();
    buildSquares();
  } 
  
  int getScore(Player player) {
    int score = 0;
    for(int i = 0; i < squares.length; i++) {
      if(squares[i].getOwner()==null)
        continue;
      if(squares[i].getOwner().getID().equals(player.getID()))
        score++;    
    }  
    return score;
  }
  
  void buildGrid() {
    grid = new Dot[gridSize][gridSize];
    for(int i = 0; i < gridSize; i++) {
      for(int j = 0; j < gridSize; j++) {
        grid[i][j] = new Dot(dotColor, xStartPos + (j*100), yStartPos + (i*100), dotSize); 
        
      }
    }   
  }
  
  void buildSquares() {
    squares = new Square[9];
    for(int i = 0; i < squares.length; i++) {
      buildSquare(i);
    }
  }
  
  void buildSquare(int squareNbr) {
    lines = new HashMap<String,Line>();
    switch (squareNbr) {
      case 0: //square 0
        lines.put(TOP, new Line(HORIZONTAL, grid[0][0], grid[0][1], color(255,255,255)));
        lines.put(RIGHT, new Line(VERTICAL, grid[0][1], grid[1][1], color(255,255,255)));
        lines.put(LEFT, new Line(VERTICAL, grid[0][0], grid[1][0], color(255,255,255)));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[1][0], grid[1][1], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 1:  //square 1
        lines.put(TOP, new Line(HORIZONTAL, grid[0][1], grid[0][2], color(255,255,255)));
        lines.put(RIGHT, new Line(VERTICAL, grid[0][2], grid[1][2], color(255,255,255)));
        lines.put(LEFT, squares[0].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[1][1], grid[1][2], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 2:  //square 2
        lines.put(TOP, new Line(HORIZONTAL, grid[0][2], grid[0][3], color(255,255,255)));
        lines.put(RIGHT, new Line(VERTICAL, grid[0][3], grid[1][3], color(255,255,255)));
        lines.put(LEFT, squares[1].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[1][2], grid[1][3], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 3:  //square 3
        lines.put(TOP, squares[0].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[1][1], grid[2][1], color(255,255,255)));
        lines.put(LEFT, new Line(VERTICAL, grid[1][0], grid[2][0], color(255,255,255)));        
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[2][0], grid[2][1], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 4:  //square 4
        lines.put(TOP, squares[1].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[1][2], grid[2][2], color(255,255,255)));
        lines.put(LEFT, squares[3].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[2][1], grid[2][2], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 5:  //square 5
        lines.put(TOP, squares[2].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[1][3], grid[2][3], color(255,255,255)));
        lines.put(LEFT, squares[4].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[2][2], grid[2][3], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 6:  //square 6
        lines.put(TOP, squares[3].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[2][1], grid[3][1], color(255,255,255)));
        lines.put(LEFT, new Line(VERTICAL, grid[2][0], grid[3][0], color(255,255,255)));        
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[3][0], grid[3][1], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 7:  //square 7
        lines.put(TOP, squares[4].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[2][2], grid[3][2], color(255,255,255)));
        lines.put(LEFT, squares[6].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[3][1], grid[3][2], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      case 8:  //square 8
        lines.put(TOP, squares[5].getLine(BOTTOM));
        lines.put(RIGHT, new Line(VERTICAL, grid[2][3], grid[3][3], color(255,255,255)));
        lines.put(LEFT, squares[7].getLine(RIGHT));
        lines.put(BOTTOM, new Line(HORIZONTAL, grid[3][2], grid[3][3], color(255,255,255)));
        squares[squareNbr] = new Square(lines);
        break;
      default:
        break;
    }    
  }    
   
  void checkLineAvailability(Player playerTurn) {
    for(int i = 0; i < squares.length; i++) {
      squares[i].checkLineAvailability(playerTurn);
    }
  }
  
  void makeMove(Player playerTurn) {
    for(int i = 0; i < squares.length; i++) {
      if( !squares[i].isOwned() )
        squares[i].makeMove(playerTurn);
    }
  }

  void displayGrid() {
    for(int i = 0; i < gridSize; i++) {
      for(int j = 0; j < gridSize; j++) {
        grid[i][j].drawDot(); 
      }
    }   
  }

  void displaySquares() {
    for(int i = 0; i < squares.length; i++) {
      squares[i].drawSquare();
    }
  }
}
