public class Board {
  private PVector pos;
  private int width;
  private int height;
  private color bgColor;
  private color border1;
  private color border2;
  private color border3;

  public Board(PVector pos, int width, int height) {
    this.pos = pos;
    this.width = width;
    this.height = height;
    bgColor = color(196, 207, 163);
    border1 = color(89, 95, 67);
    border2 = color(171, 183, 138);
    border3 = color(139, 150, 108);
  }

  public void display() {
    rectMode(CENTER);
    strokeWeight(0);
    fill(border1);
    rect(pos.x, pos.y, width+48, height+48);
    fill(border2);
    rect(pos.x, pos.y, width+38, height+38);
    fill(border3);
    rect(pos.x, pos.y, width+30, height+30);
    fill(bgColor);
    rect(pos.x, pos.y, width, height);
  }

  public int getWidth() {
    return width;
  }

  public int getHeight() {
    return height;
  }
}
