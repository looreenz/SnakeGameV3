public class Wall extends Tile {
  public Wall(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  public void display() {
    image(this.img, this.getX() * this.getSize(), this.getY() * this.getSize(), 25, 25);
  }
}
