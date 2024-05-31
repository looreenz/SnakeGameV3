/**
 * The Tile class represents a basic tile in the game grid.
 */
public class Tile {
  protected int x;       // The x-coordinate of the tile
  protected int y;       // The y-coordinate of the tile
  protected int size;    // The size of the tile (width and height)
  protected int velX;    // The velocity of the tile along the x-axis
  protected int velY;    // The velocity of the tile along the y-axis
  protected PImage img;  // The image representing the tile

  /**
   * Constructs a Tile object with the specified position.
   *
   * @param x The x-coordinate of the tile.
   * @param y The y-coordinate of the tile.
   */
  public Tile(int x, int y) {
    this.x = x;
    this.y = y;
    this.size = 25;
    this.velX = 0;
    this.velY = 0;
  }

  /**
   * Gets the x-coordinate of the tile.
   *
   * @return The x-coordinate of the tile.
   */
  public int getX() {
    return this.x;
  }

  /**
   * Gets the y-coordinate of the tile.
   *
   * @return The y-coordinate of the tile.
   */
  public int getY() {
    return this.y;
  }

  /**
   * Gets the size of the tile.
   *
   * @return The size of the tile.
   */
  public int getSize() {
    return this.size;
  }

  /**
   * Gets the velocity of the tile along the x-axis.
   *
   * @return The velocity of the tile along the x-axis.
   */
  public int getVelX() {
    return this.velX;
  }

  /**
   * Gets the velocity of the tile along the y-axis.
   *
   * @return The velocity of the tile along the y-axis.
   */
  public int getVelY() {
    return this.velY;
  }

  /**
   * Sets the x-coordinate of the tile.
   *
   * @param x The new x-coordinate of the tile.
   */
  public void setX(int x) {
    this.x = x;
  }

  /**
   * Sets the y-coordinate of the tile.
   *
   * @param y The new y-coordinate of the tile.
   */
  public void setY(int y) {
    this.y = y;
  }

  /**
   * Sets the velocity of the tile along the x-axis.
   *
   * @param x The new velocity of the tile along the x-axis.
   */
  public void setVelX(int x) {
    this.velX = x;
  }

  /**
   * Sets the velocity of the tile along the y-axis.
   *
   * @param y The new velocity of the tile along the y-axis.
   */
  public void setVelY(int y) {
    this.velY = y;
  }
}
