import controlP5.*;

/**
 * The Global class manages the global settings and state of the game.
 * It implements ControlListener to handle UI button events.
 */
public class Global implements ControlListener {
  private ControlP5 cp5;
  private Button back;
  private int BG_COLOR;
  private PFont font;
  private int fontSize;
  private int offsetX;
  private int offsetY;

  /**
   * Constructs a Global object with the specified parent PApplet.
   *
   * @param parent The parent PApplet.
   */
  public Global(PApplet parent) {
    cp5 = new ControlP5(parent);
    back = cp5.addButton("Back").setLabel("Back to Menu");
    back.setPosition(230, 400);
    back.setSize(150, 60);
    back.setColorBackground(color(0, 192, 0));
    back.setColorForeground(color(0, 170, 0));
    back.getCaptionLabel().setSize(20);
    back.hide();
    BG_COLOR = 65;
    font = createFont("data/Font_VT323/VT323-Regular.ttf", 32);
    fontSize = 34;
    offsetX = 150;
    offsetY = 150;

    cp5.addListener(this);
  }

  /**
   * Handles control events for UI elements.
   *
   * @param theEvent The control event.
   */
  public void controlEvent(ControlEvent theEvent) {
    switch(theEvent.getName()) {
    case "Back":
      init();
      break;
    }
  }

  /**
   * Returns the background color.
   *
   * @return The background color.
   */
  public int getBgColor() {
    return BG_COLOR;
  }

  /**
   * Returns the font used in the game.
   *
   * @return The font.
   */
  public PFont getFont() {
    return font;
  }

  /**
   * Returns the font size used in the game.
   *
   * @return The font size.
   */
  public int getFontSize() {
    return fontSize;
  }

  /**
   * Returns the X offset for game elements.
   *
   * @return The X offset.
   */
  public int getOffsetX() {
    return offsetX;
  }

  /**
   * Returns the Y offset for game elements.
   *
   * @return The Y offset.
   */
  public int getOffsetY() {
    return offsetY;
  }

  /**
   * Returns the sound effect for food consumption.
   *
   * @return The food sound effect.
   */
  public AudioPlayer getFoodSound() {
    return soundFood;
  }

  /**
   * Initializes the game state, resetting variables and starting background music.
   */
  public void init() {
    gameStarted = false;
    gameOver = false;
    back.hide();
    snakeHead = new Snake(5, 5, headImg);
    snakeBody = new ArrayList<Snake>();
    food = new Food(10, 10, foodImg);
    scores = new Scores();
    textSize(game.getFontSize());
    playSound(soundMusic);
  }

  /**
   * Displays the background of the game.
   * Draws a grid pattern on the screen.
   */
  public void displayBg() {
    background(65);
    fill(50);
    stroke(50);
    for (int i = 0; i < 24; i++) {
      for (int j = 0; j < 24; j++) {
        if ((i % 2 != 0 && j % 2 == 0) || (i % 2 == 0 && j % 2 != 0))
          rect(i * 25, j * 25, 25, 25);
      }
    }
  }

  /**
   * Displays the snake on the screen.
   * Draws the snake head and each part of the snake body.
   */
  public void snakeDisplay() {
    // Snake Head
    snakeHead.display();

    // Snake Body
    for (int i = 0; i < snakeBody.size(); i++) {
      Snake snakePart = snakeBody.get(i);
      snakePart.display();
    }
  }

  /**
   * Adds a new tile to the snake's body at the position of the food.
   */
  public void addTile() {
    snakeBody.add(new Snake(food.getX(), food.getY(), bodyImg));
  }

  /**
   * Moves the snake by updating the positions of the head and body parts.
   */
  public void move() {
    // Snake Body
    for (int i = snakeBody.size()-1; i >= 0; i--) {
      Snake snakePart = snakeBody.get(i);
      if (i == 0) {
        snakePart.setX(snakeHead.getX());
        snakePart.setY(snakeHead.getY());
      } else {
        Snake prevSnakePart = snakeBody.get(i-1);
        snakePart.setX(prevSnakePart.getX());
        snakePart.setY(prevSnakePart.getY());
      }
    }

    snakeHead.setX(snakeHead.getX()+snakeHead.getVelX());
    snakeHead.setY(snakeHead.getY()+snakeHead.getVelY());
  }

  /**
   * Checks for a collision between two tiles.
   * Plays the appropriate sound effect based on the collision type.
   *
   * @param tile1 The first tile.
   * @param tile2 The second tile.
   * @return true if there is a collision, false otherwise.
   */
  boolean collision(Tile tile1, Tile tile2) {
    boolean collision = false;
    if (tile1.getX() == tile2.getX() && tile1.getY() == tile2.getY())
      collision = true;
    if (collision == true && tile2 instanceof Food) {
      playSound(soundFood);
    } else if ((collision == true && tile2 instanceof Snake) || gameOver) {
      playSound(soundGameOver);
    }
    return collision;
  }

  /**
   * Plays the specified sound effect.
   *
   * @param player The AudioPlayer to play the sound.
   */
  public void playSound(AudioPlayer player) {
    if (player.isPlaying()) {
      player.rewind();
    } else {
      player.rewind();
      player.play();
    }
  }

  /**
   * Checks if the game is over by verifying collisions with the snake's body, walls, or screen boundaries.
   */
  public void checkGameOver() {
    for (int i = 0; i< snakeBody.size(); i++) {
      Snake snakePart = snakeBody.get(i);
      if (collision(snakeHead, snakePart)) {
        gameOver = true;
      }
    }
    ArrayList<Wall> wallList = level.getWallArray();
    for (int i = 0; i < wallList.size(); i++) {
      Wall wall = wallList.get(i);
      if (collision(snakeHead, wall)) {
        gameOver = true;
      }
    }
    if (snakeHead.getX() < 0 || snakeHead.getX()*snakeHead.getSize() >= 600 ||
      snakeHead.getY() < 0 || snakeHead.getY()*snakeHead.getSize() >= 600) {
      gameOver = true;
    }
  }

  /**
   * Displays the game over screen with the final score.
   */
  public void gameOver() {
    background(65);
    fill(0, 192, 0);
    textAlign(CENTER);
    textSize(96);
    text("GAME OVER", 300, 250);
    textSize(48);
    text("Your Score: " + scores.getScores(), 300, 320);
    back.show();
  }
}
