    void setup() {
      size(500, 500);
      background(255,56,55,55);
      fill(255);
      noLoop();
      PFont fontA = loadFont("courier");
      textFont(fontA, 14);
    }

    void draw() {
      text("Hello Web!", 40, 40);
      println("Hello Error Log!");
    }