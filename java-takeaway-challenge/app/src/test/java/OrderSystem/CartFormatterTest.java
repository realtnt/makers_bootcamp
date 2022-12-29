package OrderSystem;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import org.junit.Test;

public class CartFormatterTest {
  @Test
  public void renderCart() {
    Cart cart = new Cart();
    CartItem item1 = new CartItem(new Dish("Souvlaki", 5.99), 1);
    CartItem item2 = new CartItem(new Dish("Mousakas", 8.99), 2);
    CartFormatter formatter = new CartFormatter(cart);

    cart.addItem(item1);
    cart.addItem(item2);

    String expected = "1 x Souvlaki: £5.99\n" +
        "2 x Mousakas: £17.98\n";
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PrintStream printStream = new PrintStream(baos);
    System.setOut(printStream);

    formatter.renderCart();

    String[] lines = baos.toString().split(System.lineSeparator());
    String actual = lines[0] + "\n" + lines[1] + "\n";

    assertEquals(2, lines.length);
    assertEquals(expected, actual);
  }
}
