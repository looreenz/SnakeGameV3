public class Food extends Tile {
  private ArrayList<PVector> wallList;
  private PImage img;

  public Food(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
    this.wallList = level.getWallList();
  }

  public void display() {
    image(this.img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }

  public void place() {
    boolean validPosition = false;
    int newX = 0;
    int newY = 0;

    while (!validPosition) {
      newX = (int)random(600 / 25);
      newY = (int)random(600 / 25);
      validPosition = true;

      for (PVector wall : wallList) {
        if (newX == wall.x && newY == wall.y) {
          validPosition = false;
          break;
        }
      }
    }

    this.setX(newX);
    this.setY(newY);
  }
}
