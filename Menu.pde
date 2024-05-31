import controlP5.*;

/**
 * The Menu class represents the main menu of the game, handling user interactions for game difficulty selection and music toggle.
 */
public class Menu implements ControlListener {
  private ControlP5 cp5;
  private Button easy;
  private Button medium;
  private Button hard;
  private Button toggleMusic;
  private color btnColor;
  private PImage logo;
  private PImage snakeImg;
  private PImage appleImg;

  /**
   * Constructs a Menu object and initializes the menu buttons and their properties.
   *
   * @param parent The parent PApplet that is used for ControlP5 context.
   */
  public Menu(PApplet parent) {
    cp5 = new ControlP5(parent);
    this.logo = loadImage("data/img/logo1.png");
    easy = cp5.addButton("Easy").setLabel("Easy");
    medium = cp5.addButton("Medium").setLabel("Medium");
    hard = cp5.addButton("Hard").setLabel("Hard");
    toggleMusic = cp5.addButton("toggleMusic").setLabel("Music");
    btnColor = color(0, 192, 0);
    setupButton(easy, 230, 220);
    setupButton(medium, 230, 310);
    setupButton(hard, 230, 400);
    toggleMusic.setPosition(500, 40);
    toggleMusic.setSize(70, 60);
    toggleMusic.setColorBackground(btnColor);
    toggleMusic.setColorForeground(color(0, 170, 0));
    toggleMusic.getCaptionLabel().setSize(20);
    this.snakeImg = loadImage("data/img/snake.png");
    this.appleImg = loadImage("data/sprites/apple_red.png");
    cp5.addListener(this);
    game.playSound(soundMusic);
  }

  /**
   * Sets up a button with the specified position and color properties.
   *
   * @param button The button to set up.
   * @param x The x-coordinate of the button.
   * @param y The y-coordinate of the button.
   */
  private void setupButton(Button button, int x, int y) {
    button.setPosition(x, y);
    button.setSize(150, 60);
    button.setColorBackground(btnColor);
    button.setColorForeground(color(0, 170, 0));
    button.getCaptionLabel().setSize(20);
  }

  /**
   * Handles control events triggered by the buttons in the menu.
   *
   * @param theEvent The control event that occurred.
   */
  public void controlEvent(ControlEvent theEvent) {
    switch (theEvent.getName()) {
    case "Easy":
      gameStarted = true;
      level = new Level(1);
      break;
    case "Medium":
      gameStarted = true;
      level = new Level(2);
      break;
    case "Hard":
      gameStarted = true;
      level = new Level(3);
      break;
    case "toggleMusic":
      toggleMusic();
      break;
    }
  }

  /**
   * Toggles the background music on and off, changing the button color accordingly.
   */
  private void toggleMusic() {
    if (soundMusic.isPlaying()) {
      toggleMusic.setColorBackground(color(255, 0, 0));
      toggleMusic.setColorForeground(color(245, 0, 0));
      soundMusic.pause();
    } else {
      toggleMusic.setColorBackground(btnColor);
      toggleMusic.setColorForeground(color(0, 170, 0));
      game.playSound(soundMusic);
    }
  }

  /**
   * Displays the menu on the screen, including the logo, buttons, and images.
   */
  public void display() {
    background(65);
    image(logo, 105, 15);
    easy.show();
    medium.show();
    hard.show();
    toggleMusic.show();
    image(snakeImg, 300, 450);
    image(appleImg, 150, 500, 70, 70);
  }

  /**
   * Hides the menu buttons and pauses the background music.
   */
  public void hide() {
    easy.hide();
    medium.hide();
    hard.hide();
    toggleMusic.hide();
    soundMusic.pause();
  }
}
