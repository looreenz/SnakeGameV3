import controlP5.*;

/**
 * The Menu class represents the main menu of the game, handling user interactions for game difficulty selection and music toggle.
 */
public class Menu implements ControlListener {
  private ControlP5 cp5;  // ControlP5 instance for managing GUI elements
  private Button easy;    // Button for selecting easy difficulty
  private Button medium;  // Button for selecting medium difficulty
  private Button hard;    // Button for selecting hard difficulty
  private Button toggleMusic;  // Button for toggling background music
  private Button info;    // Button for displaying game information
  private Button back;    // Button for returning to the main menu from the info screen
  private color btnColor; // Default color for buttons
  private PImage logo;    // Image for the game logo
  private PImage snakeImg;  // Image for the snake
  private PImage appleImg;  // Image for the apple

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
    info = cp5.addButton("info").setLabel("Info");
    back = cp5.addButton("back").setLabel("Back");
    btnColor = color(0, 192, 0);  // Initialize the button color
    setupButton(easy, 230, 220);  // Setup easy button
    setupButton(medium, 230, 310);  // Setup medium button
    setupButton(hard, 230, 400);  // Setup hard button
    toggleMusic.setPosition(500, 40);  // Position for toggle music button
    toggleMusic.setSize(70, 60);  // Size for toggle music button
    toggleMusic.setColorBackground(btnColor);  // Background color for toggle music button
    toggleMusic.setColorForeground(color(0, 170, 0));  // Foreground color for toggle music button
    toggleMusic.getCaptionLabel().setSize(20);  // Text size for toggle music button
    info.setPosition(40, 40);  // Position for info button
    info.setSize(70, 60);  // Size for info button
    info.setColorBackground(btnColor);  // Background color for info button
    info.setColorForeground(color(0, 170, 0));  // Foreground color for info button
    info.getCaptionLabel().setSize(20);  // Text size for info button
    back.setPosition(40, 40);  // Position for back button
    back.setSize(70, 60);  // Size for back button
    back.setColorBackground(btnColor);  // Background color for back button
    back.setColorForeground(color(0, 170, 0));  // Foreground color for back button
    back.getCaptionLabel().setSize(20);  // Text size for back button
    this.snakeImg = loadImage("data/img/snake.png");  // Load snake image
    this.appleImg = loadImage("data/sprites/apple_red.png");  // Load apple image
    cp5.addListener(this);  // Add listener for ControlP5
    game.playSound(soundMusic);  // Play background music
  }

  /**
   * Sets up a button with the specified position and color properties.
   *
   * @param button The button to set up.
   * @param x The x-coordinate of the button.
   * @param y The y-coordinate of the button.
   */
  private void setupButton(Button button, int x, int y) {
    button.setPosition(x, y);  // Set button position
    button.setSize(150, 60);  // Set button size
    button.setColorBackground(btnColor);  // Set background color
    button.setColorForeground(color(0, 170, 0));  // Set foreground color
    button.getCaptionLabel().setSize(20);  // Set text size
  }

  /**
   * Handles control events triggered by the buttons in the menu.
   *
   * @param theEvent The control event that occurred.
   */
  public void controlEvent(ControlEvent theEvent) {
    switch (theEvent.getName()) {
    case "Easy":
      gameStarted = true;  // Start the game
      level = new Level(1);  // Set level to easy
      break;
    case "Medium":
      gameStarted = true;  // Start the game
      level = new Level(2);  // Set level to medium
      break;
    case "Hard":
      gameStarted = true;  // Start the game
      level = new Level(3);  // Set level to hard
      break;
    case "toggleMusic":
      toggleMusic();  // Toggle music on or off
      break;
    case "info":
      info();  // Display game information
      break;
    case "back":
      infoDisplay = false;  // Hide information display
      game.init();  // Initialize the game
      break;
    }
  }

  /**
   * Toggles the background music on and off, changing the button color accordingly.
   */
  private void toggleMusic() {
    if (soundMusic.isPlaying()) {
      toggleMusic.setColorBackground(color(255, 0, 0));  // Change background color to red
      toggleMusic.setColorForeground(color(245, 0, 0));  // Change foreground color to dark red
      soundMusic.pause();  // Pause the music
    } else {
      toggleMusic.setColorBackground(btnColor);  // Reset background color
      toggleMusic.setColorForeground(color(0, 170, 0));  // Reset foreground color
      game.playSound(soundMusic);  // Play the music
    }
  }

  /**
   * Displays game information including images and descriptions.
   */
  public void info() {
    infoDisplay = true;  // Set information display flag to true
    hide();  // Hide the main menu
    background(65);  // Set background color
    back.show();  // Show the back button
    image(headImg, 60, 140, 50, 50);  // Display snake head image
    image(appleImg, 60, 290, 50, 50);  // Display apple image
    image(wallImg, 60, 440, 50, 50);  // Display wall image
    fill(75);  // Set fill color for rectangles
    rect(150, 140, 400, 50);  // Draw rectangle for snake description
    rect(150, 290, 400, 50);  // Draw rectangle for apple description
    rect(150, 440, 400, 50);  // Draw rectangle for wall description
    fill(255);  // Set text color to white
    textSize(20);  // Set text size
    textAlign(LEFT);  // Align text to left
    // Display descriptions for each game element
    text("The snake is the main character of the game.\nThe player controls the direction of the snake.", 160, 160);
    text("The apple is the food that the snake must eat\nto grow and earn points.", 160, 310);
    text("Walls are obstacles that the snake must avoid.\nThe collision with a wall is game over.", 160, 460);
    textSize(game.getFontSize());  // Reset text size to game font size
  }

  /**
   * Displays the menu on the screen, including the logo, buttons, and images.
   */
  public void display() {
    background(65);  // Set background color
    image(logo, 105, 15);  // Display game logo
    back.hide();  // Hide the back button
    easy.show();  // Show the easy button
    medium.show();  // Show the medium button
    hard.show();  // Show the hard button
    toggleMusic.show();  // Show the toggle music button
    info.show();  // Show the info button
    image(snakeImg, 300, 450);  // Display snake image
    image(appleImg, 150, 500, 70, 70);  // Display apple image
  }

  /**
   * Hides the menu buttons and pauses the background music.
   */
  public void hide() {
    easy.hide();  // Hide the easy button
    medium.hide();  // Hide the medium button
    hard.hide();  // Hide the hard button
    toggleMusic.hide();  // Hide the toggle music button
    info.hide();  // Hide the info button
    soundMusic.pause();  // Pause the background music
  }
}
