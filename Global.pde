import controlP5.*;

public class Global implements ControlListener {
  private ControlP5 cp5;
  private Button back;
  private int BG_COLOR;
  private PFont font;
  private int fontSize;
  private int offsetX;
  private int offsetY;

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

  public void controlEvent(ControlEvent theEvent) {
    switch(theEvent.getName()) {
    case "Back":
      init();
      break;
    }
  }

  public int getBgColor() {
    return BG_COLOR;
  }

  public PFont getFont() {
    return font;
  }

  public int getFontSize() {
    return fontSize;
  }

  public int getOffsetX() {
    return offsetX;
  }

  public int getOffsetY() {
    return offsetY;
  }

  public void init() {
    gameStarted = false;
    gameOver = false;
    back.hide();
    snakeHead = new Snake(5, 5, headImg);
    snakeBody = new ArrayList<Snake>();
    food = new Food(10, 10, foodImg);
    scores = new Scores();
    textSize(game.getFontSize());
  }

  public void snakeDisplay() {
    // Snake Head
    snakeHead.display();

    // Snake Body
    for (int i = 0; i < snakeBody.size(); i++) {
      Snake snakePart = snakeBody.get(i);
      snakePart.display();
    }
  }

  public void addTile() {
    snakeBody.add(new Snake(food.getX(), food.getY(), bodyImg));
  }

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

  boolean collision(Snake tile1, Tile tile2) {
    return tile1.getX() == tile2.getX() && tile1.getY() == tile2.getY();
  }

  public void checkGameOver() {
    for (int i = 0; i< snakeBody.size(); i++) {
      Snake snakePart = snakeBody.get(i);
      if (collision(snakeHead, snakePart)) {
        gameOver = true;
      }
    }
    if (snakeHead.getX()*snakeHead.getSize() <= 0 || snakeHead.getX()*snakeHead.getSize() >= 600 ||
      snakeHead.getY()*snakeHead.getSize() <= 0 || snakeHead.getY()*snakeHead.getSize() >= 600) {
      gameOver = true;
    }
  }

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
