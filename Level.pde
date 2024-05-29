public class Level {
  private int levelIndex;
  private int wallCount;
  private int wallSize;
  private PImage wallImg;
  private ArrayList<PVector> wallArray;

  public Level(int index) {
    this.levelIndex = index;
    this.wallCount = 10;
    this.wallSize = 25;
    this.wallImg = loadImage("data/wall_block.png");
    wallArray = new ArrayList<PVector>();
    for (int i = 0; i < wallCount; i++) {
      int wallX = (int) random(600 / 25) * wallSize;
      int wallY = (int) random(600 / 25) * wallSize;
      if(wallX != food.getX() && wallY != food.getY())
        wallArray.add(new PVector(wallX, wallY));
      else
        i--;
    }
  }

  public void display() {
    switch(levelIndex) {
    case 1:
      background(game.getBgColor());
      break;

    case 2:
      background(game.getBgColor());
      /*for (PVector wall : wallArray) {
        image(wallImg, wall.x, wall.y, wallSize, wallSize);
      }*/
      break;

    case 3:
      background(255);
      break;
    }
  }
  
  public ArrayList<PVector> getWallList(){
    return wallArray;
  }
}
