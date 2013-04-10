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
