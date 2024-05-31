/** //<>//
 * The Food class represents the food item in the Snake Game.
 * It extends the Tile class and includes methods for displaying and placing the food.
 */
public class Food extends Tile {

  /**
   * Constructs a Food object at the specified position with the given image.
   *
   * @param x   The x-coordinate of the food's position.
   * @param y   The y-coordinate of the food's position.
   * @param img The image of the food.
   */
  public Food(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  /**
   * Displays the food on the screen at its current position.
   */
  public void display() {
    image(this.img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }

  /**
   * Places the food at a new random position on the grid.
   * Ensures the food does not overlap with walls.
   */
  public void place() {
    boolean firstPlace = true;

    if (firstPlace) {
      this.setX((int)random(600 / 25));
      this.setY((int)random(600 / 25));
    } else {
      ArrayList<Wall> wallList = new ArrayList<Wall>();
      wallList = level.getWallArray();
      int newX = 0;
      int newY = 0;
      boolean validPos = false;
      while (validPos == false) {
        newX = (int)random(600 / 25);
        newY = (int)random(600 / 25);
        for (Wall wall : wallList) {
          if (!game.collision(food, wall)) {
            this.setX(newX);
            this.setY(newY);
            validPos = true;
          }
        }
      }
    }
  }
}
