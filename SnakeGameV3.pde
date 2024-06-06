/** //<>//
 * Snake Game V3.
 * A Java snake game developed in Processing IDE and its API with info page, sound control and difficulty selection.
 * Easy: the classic snake game, don't touch the edges or yourself or you'll die;
 * Medium: a set of wall is placed with random positions at the beginning if the game;
 * Hard: every apple eaten, one wall more on the table, with random position so watch out!
 * The only thing you need to do is press Play and have fun!
 *
 * @author: Lorenzo Cremonese
 * @version: 3.0
 * @since: 16/04/2024
 */

import ddf.minim.*;

/**
 * Main class for the Snake Game.
 * Manages the setup and draw functions as well as user input.
 */

Minim minim;
AudioPlayer soundFood, soundGameOver, soundMove, soundMusic;
Global game;
Menu menu;
Level level;
Scores scores;
Snake snakeHead;
PImage headImg;
ArrayList<Snake> snakeBody;
PImage bodyImg;
Food food;
PImage foodImg;
PImage wallImg;
boolean gameOver = false;
boolean gameStarted = false;
boolean infoDisplay = false;

/**
 * Initial setup for the game.
 * Loads images, sounds, and initializes game objects.
 */
void setup() {
  size(600, 600);
  frameRate(8); // Set the frame rate to 8 frames per second.
  minim = new Minim(this);

  // Load sound effects.
  soundFood = minim.loadFile("data/sound_effects/music_food.mp3");
  soundGameOver = minim.loadFile("data/sound_effects/music_gameover.mp3");
  soundMove = minim.loadFile("data/sound_effects/music_move.mp3");
  soundMusic = minim.loadFile("data/sound_effects/music_music.mp3");

  // Initialize game components.
  game = new Global(this);
  textFont(game.getFont());
  textSize(game.getFontSize());
  menu = new Menu(this);
  scores = new Scores();

  // Load images and initialize snake head and body.
  headImg = loadImage("data/sprites/snake_green_head.png");
  snakeHead = new Snake(5, 5, headImg);
  bodyImg = loadImage("data/sprites/snake_green_blob.png");
  snakeBody = new ArrayList<Snake>();

  // Load image and initialize food.
  foodImg = loadImage("data/sprites/apple_red.png");
  food = new Food(10, 10, foodImg);

  // Load wall image.
  wallImg = loadImage("data/sprites/wall_block.png");
}

/**
 * Main draw loop for the game.
 * Handles the display and game logic.
 */
void draw() {
  if (!gameStarted && !infoDisplay) {
    menu.display(); // Display the menu if the game has not started.
  } else {
    menu.hide(); // Hide the menu if the game has started.
    if (!gameOver && !infoDisplay) {
      // Display game background, level, scores, food, and snake.
      game.displayBg();
      level.display();
      scores.display();
      food.display();
      game.snakeDisplay();

      game.move(); // Move the snake.
      game.checkGameOver(); // Check if the game is over.

      // Check for collision between the snake head and the food.
      if (game.collision(snakeHead, food)) {
        game.addTile(); // Add a new tile to the snake body.
        if (level.getLevelIndex() == 3) {
          // Place a wall randomly on the grid if the level index is 3.
          level.placeWall((int) random(600 / 25), (int) random(600 / 25));
        }
        food.place(); // Place the food at a new random location.
        scores.update(1); // Update the score.
      }
    } else if (!infoDisplay) {
      game.gameOver(); // Display game over screen if the game is over.
    }
  }
}

/**
 * Handles keyboard input for controlling the snake.
 */
void keyPressed() {
  switch (keyCode) {
  case UP:
    snakeHead.setVelX(0); // Set snake's horizontal velocity to 0.
    snakeHead.setVelY(-1); // Set snake's vertical velocity to move up.
    game.playSound(soundMove); // Play move sound effect.
    snakeHead.setImg(loadImage("data/sprites/snake_green_head_up.png")); // Change snake head image.
    break;
  case DOWN:
    snakeHead.setVelX(0); // Set snake's horizontal velocity to 0.
    snakeHead.setVelY(1); // Set snake's vertical velocity to move down.
    game.playSound(soundMove); // Play move sound effect.
    snakeHead.setImg(loadImage("data/sprites/snake_green_head.png")); // Change snake head image.
    break;
  case LEFT:
    snakeHead.setVelX(-1); // Set snake's horizontal velocity to move left.
    snakeHead.setVelY(0); // Set snake's vertical velocity to 0.
    game.playSound(soundMove); // Play move sound effect.
    snakeHead.setImg(loadImage("data/sprites/snake_green_head_left.png")); // Change snake head image.
    break;
  case RIGHT:
    snakeHead.setVelX(1); // Set snake's horizontal velocity to move right.
    snakeHead.setVelY(0); // Set snake's vertical velocity to 0.
    game.playSound(soundMove); // Play move sound effect.
    snakeHead.setImg(loadImage("data/sprites/snake_green_head_right.png")); // Change snake head image.
    break;
  }
}
