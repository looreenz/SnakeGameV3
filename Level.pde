/**
 * The Level class manages the different levels in the game, including the placement of walls.
 */
public class Level {
  private int levelIndex;
  private int wallCount;
  private ArrayList<Wall> wallArray;

  /**
   * Constructs a Level object with the specified level index.
   *
   * @param index The index of the level.
   */
  public Level(int index) {
    this.levelIndex = index;
    this.wallCount = 10;
    this.wallArray = new ArrayList<Wall>();
  }

  /**
   * Displays the level on the screen.
   * Depending on the level index, different backgrounds and walls are displayed.
   */
  public void display() {
    switch(levelIndex) {
    case 1:
      game.displayBg();
      break;

    case 2:
      game.displayBg();
      if (wallArray.size() == 0) {
        for (int i = 0; i < wallCount; i++) {
          placeWall((int)random(600 / 25), (int)random(600 / 25));
        }
      }
      for (Wall wall : wallArray) {
        wall.display();
      }
      break;

    case 3:
      game.displayBg();
      for (Wall wall : wallArray) {
        wall.display();
      }
      break;
    }
  }

  /**
   * Places a wall at the specified coordinates and adds it to the wall array.
   *
   * @param x The x-coordinate for the wall.
   * @param y The y-coordinate for the wall.
   */
  public void placeWall(int x, int y) {
    int wallX = x;
    int wallY = y;
    this.wallArray.add(new Wall(wallX, wallY, wallImg));
  }

  /**
   * Returns the current level index.
   *
   * @return The level index.
   */
  public int getLevelIndex() {
    return this.levelIndex;
  }

  /**
   * Returns the array of walls in the level.
   *
   * @return The wall array.
   */
  public ArrayList<Wall> getWallArray() {
    return this.wallArray;
  }
}
