package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

public class CartItemTest {
  Dish dish;

  @Before
  public void setup() {
    dish = mock(Dish.class);
    when(dish.getName()).thenReturn("Pasta");
    when(dish.getPrice()).thenReturn(4.99);
  }

  @Test
  public void addItemAndGetNamePriceAndQuantity() {
    CartItem item = new CartItem(dish, 1);

    assertEquals("Pasta", item.getName());
    assertEquals(Double.valueOf(4.99), item.getPrice());
    assertEquals(Integer.valueOf(1), item.getQuantity());
  }

  @Test
  public void setItemQuantity() {
    CartItem item = new CartItem(dish, 1);

    item.setQuantity(3);

    assertEquals("Pasta", item.getName());
    assertEquals(Double.valueOf(14.97), item.getPrice());
    assertEquals(Integer.valueOf(3), item.getQuantity());
  }

  @Test
  public void setId() {
    CartItem item = new CartItem(dish, 1);

    assertNull(item.getId());

    item.setId(1);
    assertEquals(Integer.valueOf(1), item.getId());
  }

}
