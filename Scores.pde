public class Scores {
  private int score;
  private color scoreColor;

  public Scores() {
    this.score = 0;
    this.scoreColor = color(0, 192, 0);
  }

  public void display() {
    fill(scoreColor);
    String strScore = padLeft(score);
    text(strScore, 30, 40);
  }

  public String padLeft(int scoreToPad) {
    String str = String.valueOf(scoreToPad);
    if (str.length() == 3)
      return str;
    StringBuilder sb = new StringBuilder(str);
    while (sb.length() < 3) {
      sb.insert(0, '0');
    }
    return sb.toString();
  }

  public void update(int points) {
    this.score += points;
  }

  public int getScores() {
    return score;
  }
}
