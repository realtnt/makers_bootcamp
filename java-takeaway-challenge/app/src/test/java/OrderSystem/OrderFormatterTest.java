package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class OrderFormatterTest {
  Cart cart;
  Customer customer;
  CartFormatter formatter;

  @Before
  public void setup() {
    cart = mock(Cart.class);
    CartItem item1 = new CartItem(new Dish("Souvlaki", 5.99), 1);
    CartItem item2 = new CartItem(new Dish("Mousakas", 8.99), 2);
    formatter = new CartFormatter(cart);

    cart.addItem(item1);
    cart.addItem(item2);
  }

  @Test
  public void renderOrder() {
    // Order order = new Order(cart, customer);
    // OrderFormatter formatter = new OrderFormatter(order);
    // String expected = "1 x Souvlaki: £5.99\n" +
    // "2 x Mousakas: £17.98\n" +
    // "Total: £23.97\n" +
    // "Order Time: 00:00";
    // ByteArrayOutputStream baos = new ByteArrayOutputStream();
    // PrintStream printStream = new PrintStream(baos);
    // System.setOut(printStream);

    // Clock clock = Clock.fixed(Instant.parse("2022-01-01T00:00:00.00Z"),
    // ZoneId.of("UTC"));

    // order.submit(clock);

    // formatter.renderOrder();

    // List<String> lines =
    // Arrays.asList(baos.toString().split(System.lineSeparator()));
    // String actual = String.join("\n", lines);

    // assertEquals(expected, actual);
  }
}
