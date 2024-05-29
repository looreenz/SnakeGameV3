public class Tile {
  protected int x;
  protected int y;
  protected int size;
  protected int velX;
  protected int velY;
  protected PImage img;

  public Tile(int x, int y) {
    this.x = x;
    this.y = y;
    this.size = 25;
    this.velX = 0;
    this.velY = 0;
  }

  public int getX() {
    return this.x;
  }

  public int getY() {
    return this.y;
  }

  public int getSize() {
    return this.size;
  }

  public int getVelX() {
    return this.velX;
  }

  public int getVelY() {
    return this.velY;
  }

  public void setX(int x) {
    this.x = x;
  }

  public void setY(int y) {
    this.y = y;
  }

  public void setVelX(int x) {
    this.velX = x;
  }

  public void setVelY(int y) {
    this.velY = y;
  }
}
