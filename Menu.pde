import controlP5.*;

public class Menu implements ControlListener {
  private ControlP5 cp5;
  private Button easy;
  private Button medium;
  private Button hard;
  private color btnColor;
  private PImage logo;
  private PImage snakeImg;
  private PImage appleImg;

  public Menu(PApplet parent) {
    cp5 = new ControlP5(parent);
    this.logo = loadImage("data/logo1.png");
    easy = cp5.addButton("Easy").setLabel("Easy");
    medium = cp5.addButton("Medium").setLabel("Medium");
    hard = cp5.addButton("Hard").setLabel("Hard");
    btnColor = color(0, 192, 0);
    easy.setPosition(230, 220);
    easy.setSize(150, 60);
    easy.setColorBackground(btnColor);
    easy.setColorForeground(color(0, 170, 0));
    easy.getCaptionLabel().setSize(20);
    medium.setPosition(230, 310);
    medium.setSize(150, 60);
    medium.setColorBackground(btnColor);
    medium.setColorForeground(color(0, 170, 0));
    medium.getCaptionLabel().setSize(20);
    hard.setPosition(230, 400);
    hard.setSize(150, 60);
    hard.setColorBackground(btnColor);
    hard.setColorForeground(color(0, 170, 0));
    hard.getCaptionLabel().setSize(20);
    this.snakeImg = loadImage("data/snake.png");
    this.appleImg = loadImage("data/apple_red.png");
    cp5.addListener(this);
  }

  public void controlEvent(ControlEvent theEvent) {
    switch(theEvent.getName()) {
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
    }
  }

  public void display() {
    background(65);
    imageMode(CENTER);
    image(logo, 300, 100);
    easy.show();
    medium.show();
    hard.show();
    image(snakeImg, 500, 550);
    image(appleImg, 150, 550, 70, 70);
  }

  public void hide() {
    easy.hide();
    medium.hide();
    hard.hide();
  }
}
