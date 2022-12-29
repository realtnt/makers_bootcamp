package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

public class CartTest {
  Cart cart;
  CartItem item1;
  CartItem item2;

  @Before
  public void setup() {
    cart = new Cart();

    item1 = mock(CartItem.class);
    item2 = mock(CartItem.class);
    when(item1.getName()).thenReturn("Pasta");
    when(item1.getPrice()).thenReturn(1.99);
    when(item1.getQuantity()).thenReturn(1);

    when(item2.getName()).thenReturn("Panacotta");
    when(item2.getPrice()).thenReturn(2.99);
    when(item2.getQuantity()).thenReturn(2);
  }

  @Test
  public void createEmptyCart() {
    assertTrue(cart.getItems().isEmpty());
  }

  @Test
  public void addItemToCartAndGetItemNameAndPrice() {
    cart.addItem(item1);
    assertEquals("Pasta", cart.getItems().get(0).getName());
    assertEquals(Double.valueOf(1.99), cart.getItems().get(0).getPrice());
    assertEquals(Integer.valueOf(1), cart.getItems().get(0).getQuantity());
  }

  @Test
  public void removeItemFromMenuReturnsEmptyList() {
    cart.addItem(item1);

    assertEquals("Pasta", cart.getItems().get(0).getName());
    assertEquals(Double.valueOf(1.99), cart.getItems().get(0).getPrice());
    assertEquals(Integer.valueOf(1), cart.getItems().get(0).getQuantity());

    cart.removeItem(item1);

    assertTrue(cart.getItems().isEmpty());
  }

  // Integration test Cart, CartItem, Dish
  @Test
  public void addAndRemoveItemsFromMenu() {
    CartItem item3 = new CartItem(new Dish("Pasta", 4.99), 1);
    CartItem item4 = new CartItem(new Dish("Panacotta", 5.99), 2);
    cart.addItem(item3);
    cart.addItem(item4);

    cart.removeItem(item3);

    assertEquals(1, cart.getItems().size());

    cart.removeItem(item4);

    assertEquals(1, cart.getItems().size());

    cart.removeItem(item4);

    assertTrue(cart.getItems().isEmpty());
  }
}
