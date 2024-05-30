Global game; //<>//
Menu menu;
Level level;
Scores scores;
Snake snakeHead;
PImage headImg;
ArrayList<Snake> snakeBody;
PImage bodyImg;
Food food;
PImage foodImg;
boolean gameOver = false;
boolean gameStarted = false;

void setup() {
  size(600, 600);
  frameRate(6);
  game = new Global(this);
  textFont(game.getFont());
  textSize(game.getFontSize());
  menu = new Menu(this);
  scores = new Scores();
  headImg = loadImage("data/snake_green_head.png");
  snakeHead = new Snake(5, 5, headImg);
  bodyImg = loadImage("data/snake_green_blob.png");
  snakeBody = new ArrayList<Snake>();
  foodImg = loadImage("data/apple_red.png");
  food = new Food(10, 10, foodImg);
  food.place();
}

void draw() {
  if (gameStarted == false) { //<>//
    menu.display();
  } else {
    menu.hide();
    if (gameOver == false) {
      level.display();
      scores.display(); // Display Scores
      food.display(); // Display Food
      game.snakeDisplay(); // Display Snake
      if (game.collision(snakeHead, food)) {
        game.addTile(); // Add an element to the Snake Body
        food.place(); // Change Food position
        scores.update(1); // Score increment
      }
      game.move(); // Move Snake
      game.checkGameOver(); // Check if the game is over
    } else {
      game.gameOver(); // Displays Game Over
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    snakeHead.setVelX(0);
    snakeHead.setVelY(-1);
  }

  switch(keyCode) {
  case UP:
    snakeHead.setVelX(0);
    snakeHead.setVelY(-1);
    snakeHead.setImg(loadImage("data/snake_green_head_up.png"));
    break;
  case DOWN:
    snakeHead.setVelX(0);
    snakeHead.setVelY(1);
    snakeHead.setImg(loadImage("data/snake_green_head.png"));
    break;
  case LEFT:
    snakeHead.setVelX(-1);
    snakeHead.setVelY(0);
    snakeHead.setImg(loadImage("data/snake_green_head_left.png"));
    break;
  case RIGHT:
    snakeHead.setVelX(1);
    snakeHead.setVelY(0);
    snakeHead.setImg(loadImage("data/snake_green_head_right.png"));
    break;
  }
}
