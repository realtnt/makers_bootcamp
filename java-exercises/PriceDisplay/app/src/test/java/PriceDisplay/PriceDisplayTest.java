/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package PriceDisplay;

import org.junit.Test;
import static org.junit.Assert.*;

public class PriceDisplayTest {
  @Test
  public void testGetPriceLabel() {
    PriceDisplay label = new PriceDisplay();
    assertEquals("Burger and 2.99 should return Burger: £2.99",
        String.valueOf("Burger: £2.99"),
        label.getPriceLabel("Burger", 2.99));
  }
}
