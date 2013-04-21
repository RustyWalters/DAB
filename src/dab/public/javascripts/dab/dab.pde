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
static final int TWO_HUMAN_PLAYER_MODE = 2;
static final int HUMAN_EASY_COMPUTER_PLAYER_MODE = 3;
static final int HUMAN_MEDIUM_COMPUTER_PLAYER_MODE = 4;
static final int DEMO_MODE = 99;
static final int GAME_OVER = 999;
boolean setup_complete = false;

interface JavaScript {
  void showScores(int p1Score, int p2Score);
  void gameOver(int p1, int p2);
  int getMode();
}
 
void bindJavascript(JavaScript js) {
  javascript = js;
}
 
JavaScript javascript;


DABGame game;
Player player1;
Player player2;
DABStrategy player1Strategy;
DABStrategy player2Strategy;

void setup() {
  size(900, 400);
  frameRate(5);
  game = new DABGame(3);
}

void finish_setup() {
  game.setGameMode(javascript.getMode());
  setStrategies();
  player1 = new Player(color(255,0,0), "player1", player1Strategy);
  player2 = new Player(color(0,0,255), "player2", player2Strategy);
  game.setPlayer(1, player1);
  game.setPlayer(2, player2);
  setup_complete = true;  
}

void setStrategies() {
  int game_mode = game.getGameMode();
  switch (game_mode) {
    case TWO_HUMAN_PLAYER_MODE:
      player1Strategy = new DABHumanStrategy();
      player2Strategy = new DABHumanStrategy(); 
      break;
    case HUMAN_EASY_COMPUTER_PLAYER_MODE:
      player1Strategy = new DABHumanStrategy();
      player2Strategy = new DABComputerEasyStrategy(); 
      break;
    
    case HUMAN_MEDIUM_COMPUTER_PLAYER_MODE:
      player1Strategy = new DABHumanStrategy();
      player2Strategy = new DABComputerMediumStrategy(); 
      break;

    case DEMO_MODE:
      player1Strategy = new DABComputerMediumStrategy();
      player2Strategy = new DABComputerMediumStrategy(); 
      break;
    
    default:
      break;
  
  }  
}

void draw() {
  if(setup_complete == false) {
    finish_setup();
  }
  game.play();
}

void mousePressed() {
  game.makeMove();
}
