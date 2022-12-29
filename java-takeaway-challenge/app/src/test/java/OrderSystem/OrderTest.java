package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.junit.Before;
import org.junit.Test;

public class OrderTest {
  Cart cart;
  Customer customer;

  @Before
  public void setup() {
    cart = mock(Cart.class);
    customer = mock(Customer.class);
  }

  @Test
  public void orderTimeNullBeforeSubmit() {
    Order order = new Order(cart, customer);

    assertNull(order.getOrderTime());
  }

  @Test
  public void getOrderTimeAfterSubmit() {
    Clock clock = Clock.fixed(Instant.parse("2022-01-01T00:00:00.00Z"), ZoneId.of("UTC"));
    Order order = new Order(cart, customer);

    order.submit(clock);

    assertEquals(LocalDateTime.now(clock), order.getOrderTime());
  }
}
