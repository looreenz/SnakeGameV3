/**
 * The Wall class represents a wall obstacle in the game.
 */
public class Wall extends Tile {

  /**
   * Constructs a Wall object with the specified position and image.
   *
   * @param x   The x-coordinate of the wall's position.
   * @param y   The y-coordinate of the wall's position.
   * @param img The image representing the wall.
   */
  public Wall(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  /**
   * Displays the wall on the screen.
   */
  public void display() {
    image(this.img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }
}
