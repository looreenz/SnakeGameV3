/**
 * The Snake class represents the snake entity in the game.
 */
public class Snake extends Tile {

  /**
   * Constructs a Snake object with the specified position and image.
   *
   * @param x   The x-coordinate of the snake's position.
   * @param y   The y-coordinate of the snake's position.
   * @param img The image representing the snake.
   */
  public Snake(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  /**
   * Sets the image of the snake.
   *
   * @param img The new image for the snake.
   */
  public void setImg(PImage img) {
    this.img = img;
  }

  /**
   * Displays the snake on the screen.
   */
  public void display() {
    image(img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }
}
