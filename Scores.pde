/**
 * The Scores class manages the player's score in the game.
 */
public class Scores {
  private int score;
  private color scoreColor;

  /**
   * Constructs a Scores object, initializing the score to 0 and setting the score color.
   */
  public Scores() {
    this.score = 0;
    this.scoreColor = color(0, 192, 0);
  }

  /**
   * Displays the score on the screen with the specified color.
   */
  public void display() {
    fill(scoreColor);
    String strScore = padLeft(score);
    text(strScore, 30, 45);
  }

  /**
   * Pads the score with leading zeros to ensure it is at least three digits long.
   *
   * @param scoreToPad The score to pad.
   * @return The padded score as a String.
   */
  public String padLeft(int scoreToPad) {
    String str = String.valueOf(scoreToPad);
    if (str.length() == 3) {
      return str;
    }
    StringBuilder sb = new StringBuilder(str);
    while (sb.length() < 3) {
      sb.insert(0, '0');
    }
    return sb.toString();
  }

  /**
   * Updates the score by adding the specified number of points.
   *
   * @param points The number of points to add to the score.
   */
  public void update(int points) {
    this.score += points;
  }

  /**
   * Returns the current score.
   *
   * @return The current score.
   */
  public int getScores() {
    return score;
  }
}
