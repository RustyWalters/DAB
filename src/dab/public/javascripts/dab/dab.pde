import java.util.*;

boolean overBox = false;
int lineWidth = 50;
int lineHeight = 5;
float lineX = 100.0;
float lineY = 100.0;
String HORIZONTAL = "HORIZONTAL";
String VERTICAL = "VERTICAL";
String TOP = "TOP";
String BOTTOM = "BOTTOM";
String LEFT = "LEFT";
String RIGHT = "RIGHT";
String PLAYER1 = "PLAYER1";
String PLAYER2 = "PLAYER2";

DABGame game;
Player player1;
Player player2;

void setup() {
  size(900, 500);
  game = new DABGame(3);
  player1 = new Player(color(255,0,0), "player1");
  player2 = new Player(color(0,0,255), "player2");
  game.setPlayer(1, player1);
  game.setPlayer(2, player2);
  
}

void draw() {
  game.play();
}

void mousePressed() {
  game.makeMove();
}


class Dot {
  float xpos;
  float ypos;
  int size;
  color dot_color; 
  Dot(color theColor, float theXpos, float theYpos, int theSize) {
    dot_color = theColor;
    xpos = theXpos;
    ypos = theYpos;
    size = theSize;
  }  
  
  float getXPos() {
    return xpos;
  }
  
  float getYPos() {
    return ypos;
  }
  
  int getSize() {
    return size;
  }

  void drawDot() {
    fill(dot_color);
    ellipse(xpos, ypos, size, size);
  }  
}  

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
        break;
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
//    squares[1] = buildSquare(2);

    //square 2
    
//    lines[4] = new Line(HORIZONTAL, grid[0][1], grid[0][2], color(255,255,255));
//    lines[5] = new Line(HORIZONTAL, grid[1][1], grid[1][2], color(255,255,255));
//    lines[6] = new Line(VERTICAL, grid[0][2], grid[1][2], color(255,255,255));
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
  
  HashMap<String,Integer> getScores() {
    HashMap<String,Integer> scores = new HashMap<String,Integer>();
    int player1_score = board.getScore(player1);
    int player2_score = board.getScore(player2);
    scores.put(PLAYER1, new Integer(player1_score));
    scores.put(PLAYER2, new Integer(player2_score));
    return scores;
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
  }
  
  void displayScores() {
    HashMap<String,Integer> scores = getScores();
    System.out.println("Player1 score: " + scores.get(PLAYER1));  
    System.out.println("Player2 score: " + scores.get(PLAYER2));
  }
  
  void makeMove() {
    board.makeMove(playerTurn);
    determinePlayersTurn();   
    displayScores();
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

class Line {
  Dot startDot;
  Dot endDot;
  color lineColor;
  float lineHeight;
  float xPos;
  float yPos;
  float lineLength;
  String direction;
  Player owner;
 
  Line(String theDirection, Dot theStartDot, Dot theEndDot, color theLineColor) {
    direction = theDirection;
    startDot = theStartDot;
    endDot = theEndDot;
    lineColor = theLineColor;
    owner = null;
    if(direction == HORIZONTAL) {
      lineHeight = 5;
      lineLength = (endDot.getXPos() - startDot.getXPos()) - startDot.getSize();
      xPos = startDot.getXPos()+startDot.getSize()/2;
      yPos = startDot.getYPos()-lineHeight/2;
    } else {
      lineLength = 5;
      lineHeight = (endDot.getYPos() - startDot.getYPos()) - startDot.getSize();
      xPos = startDot.getXPos()-startDot.getSize()/6;
      yPos = startDot.getYPos()+startDot.getSize()/2;
    }      
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;  
  }
  
  float getLineLength() {
    return lineLength;
  }
  
  float getLineHeight() {
    return lineHeight;
  } 
   
  
  void checkLineAvailability(Player playerTurn) {
    if(hasOwner()) return;
      if(isSelected()) {
        lineColor = playerTurn.getColorCode();
    } else {
      lineColor = color(255,255,255);  
    }
  }    
 
  void makeMove(Player playerTurn) {
    if(hasOwner()) return;
    if(isSelected()) {
      setOwner(playerTurn);
        game.setValidMove(true);
    } else {
      lineColor = color(255,255,255);  
    }
  }    
  
  void setOwner(Player playerTurn) {
      lineColor = playerTurn.getColorCode();
      owner = playerTurn;
  }
  
  boolean isSelected() {
    if (mouseX > xPos && mouseX < xPos+lineLength &&
        mouseY > yPos && mouseY < yPos+lineHeight)
       return true;
    else
       return false; 
  }
  
  boolean hasOwner() {
    if(owner != null)
      return true;
    else
      return false;  
  }

  void drawLine() {
    fill(lineColor);
    rect(xPos, yPos, lineLength, lineHeight);   
  } 
}

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
        if(allLinesOwned()) {
          setOwner(playerTurn);  
          game.setTookSquare(true);
        }      
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

