public class Snake extends Tile {
  public Snake(int x, int y, PImage img) {
    super(x, y);
    this.img = img;
  }

  public void setImg(PImage img) {
    this.img = img;
  }

  public void display() {
    image(img, this.getX()*this.getSize(), this.getY()*this.getSize(), 25, 25);
  }
}
