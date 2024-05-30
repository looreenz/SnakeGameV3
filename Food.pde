public class Food extends Tile {
  private Level level;

  public Food(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  public void display() {
    image(this.img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }

  public void place() {
    boolean validPosition = false;
    int newX = 0;
    int newY = 0;
    ArrayList<Wall> wallList = new ArrayList<Wall>();
    wallList = level.getWallArray();

    while (!validPosition) {
      newX = (int)random(600 / 25);
      newY = (int)random(600 / 25);
      validPosition = true;

      for (Wall wall : wallList) {
        if (newX == wall.getX() && newY == wall.getY()) {
          validPosition = false;
          break;
        }
      }
    }

    this.setX((int)random(600 / 25));
    this.setY((int)random(600 / 25));
  }
}
