/*
 * This Java source file was generated by the Gradle 'init' task.
 */

import org.junit.Test;
import static org.junit.Assert.*;

public class MiddleLettersTest {
  @Test
  public void methodReturnsMiddleLetter() {
    MiddleLetters app = new MiddleLetters();

    assertEquals(String.valueOf('t'), app.getMiddleLetters("testing"));
  }

  @Test
  public void methodReturnsMiddleLetter2() {
    MiddleLetters app = new MiddleLetters();

    assertEquals(String.valueOf('A'), app.getMiddleLetters("A"));
  }

  @Test
  public void methodReturnsMiddleLetters() {
    MiddleLetters app = new MiddleLetters();

    assertEquals(String.valueOf("es"), app.getMiddleLetters("test"));
  }

  @Test
  public void methodReturnsMiddleLetters2() {
    MiddleLetters app = new MiddleLetters();

    assertEquals(String.valueOf("dd"), app.getMiddleLetters("middle"));
  }

  @Test
  public void methodReturnsMiddleLetters3() {
    MiddleLetters app = new MiddleLetters();

    assertEquals(String.valueOf("of"), app.getMiddleLetters("of"));
  }
}