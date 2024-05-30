public class Level {
  private int levelIndex;
  private int wallCount;
  private PImage wallImg;
  private ArrayList<Wall> wallArray;

  public Level(int index) {
    this.levelIndex = index;
    this.wallCount = 10;
    this.wallImg = loadImage("data/wall_block.png");
    this.wallArray = new ArrayList<Wall>();
    for (int i = 0; i < wallCount; i++) {
      int wallX = (int) random(600 / 25);
      int wallY = (int) random(600 / 25);
      this.wallArray.add(new Wall(wallX, wallY, wallImg));
    }
  }

  public void display() {
    switch(levelIndex) {
    case 1:
      background(game.getBgColor());
      break;

    case 2:
      background(game.getBgColor());
      for (Wall wall : wallArray) {
        wall.display();
      }
      break;

    case 3:
      background(255);
      break;
    }
  }

  public ArrayList<Wall> getWallArray() {
    return this.wallArray;
  }
}
