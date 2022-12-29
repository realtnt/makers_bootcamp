package scrabble.solver;

import org.junit.Test;

import static org.junit.Assert.*;

public class ScrabbleSolverTest {

  // scrabble = Scrabble.new('')
  // scrabble.score # => 0
  @Test
  public void testNoCharactersReturnsScoreZero() {
    ScrabbleSolver scrabble = new ScrabbleSolver("");

    assertEquals(Integer.valueOf(0), scrabble.score());
  }

  // scrabble = Scrabble.new(" \t\n")
  // scrabble.score # => 0
  @Test
  public void testWhiteSpaceReturnsScoreZero() {
    ScrabbleSolver scrabble = new ScrabbleSolver(" \t\n");

    assertEquals(Integer.valueOf(0), scrabble.score());
  }

  // scrabble = Scrabble.new(nil)
  // scrabble.score # => 0
  @Test
  public void testNilReturnsScoreZero() {
    ScrabbleSolver scrabble = new ScrabbleSolver(null);

    assertEquals(Integer.valueOf(0), scrabble.score());
  }

  // scrabble = Scrabble.new('a')
  // scrabble.score # => 1

  @Test
  public void testLetterAReturnsScoreOne() {
    ScrabbleSolver scrabble = new ScrabbleSolver("a");

    assertEquals(Integer.valueOf(1), scrabble.score());
  }

  // scrabble = Scrabble.new('f')
  // scrabble.score # => 4
  @Test
  public void testLetterFReturnsScoreFour() {
    ScrabbleSolver scrabble = new ScrabbleSolver("f");

    assertEquals(Integer.valueOf(4), scrabble.score());
  }

  // scrabble = Scrabble.new('street')
  // scrabble.score # => 6
  @Test
  public void testWordStreetReturnsScoreSix() {
    ScrabbleSolver scrabble = new ScrabbleSolver("street");

    assertEquals(Integer.valueOf(6), scrabble.score());
  }

  // scrabble = Scrabble.new('quirky')
  // scrabble.score # => 22
  @Test
  public void testWordQuirkyReturnsScore22() {
    ScrabbleSolver scrabble = new ScrabbleSolver("quirky");

    assertEquals(Integer.valueOf(22), scrabble.score());
  }

  // scrabble = Scrabble.new('OXYPHENBUTAZONE')
  // scrabble.score # => 41
  @Test
  public void testWordOXYPHENBUTAZONEReturnsScore41() {
    ScrabbleSolver scrabble = new ScrabbleSolver("OXYPHENBUTAZONE");

    assertEquals(Integer.valueOf(41), scrabble.score());
  }
}
