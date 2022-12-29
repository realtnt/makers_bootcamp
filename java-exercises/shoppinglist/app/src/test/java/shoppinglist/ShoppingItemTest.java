package shoppinglist;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class ShoppingItemTest {
  @Test
  public void testShoppingItem() {
    ShoppingItem item = new ShoppingItem("milk", 0.99);

    assertEquals("milk", item.getName());
    assertEquals(Double.valueOf(0.99), item.getPrice());
  }
}
