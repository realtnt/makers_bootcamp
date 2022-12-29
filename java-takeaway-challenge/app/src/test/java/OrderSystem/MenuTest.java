package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Test;

public class MenuTest {
  @Test
  public void createEmptyMenu() {
    Menu menu = new Menu();

    assertTrue(menu.getMenu().isEmpty());
  }

  @Test
  public void addDishToMenuAndGetItemNameAndPrice() {
    Menu menu = new Menu();
    Dish dish = mock(Dish.class);

    when(dish.getName()).thenReturn("Pasta");
    when(dish.getPrice()).thenReturn(4.99);
    menu.addDish(dish);

    assertEquals("Pasta", menu.getMenu().get(0).getName());
    assertEquals(Double.valueOf(4.99), menu.getMenu().get(0).getPrice());
  }

  @Test
  public void removeItemFromMenuReturnsEmptyList() {
    Menu menu = new Menu();
    Dish dish = mock(Dish.class);

    when(dish.getName()).thenReturn("Pasta");
    when(dish.getPrice()).thenReturn(4.99);
    when(dish.getId()).thenReturn(0);
    menu.addDish(dish);

    assertEquals("Pasta", menu.getMenu().get(0).getName());
    assertEquals(Double.valueOf(4.99), menu.getMenu().get(0).getPrice());

    menu.removeDish(dish);

    assertTrue(menu.getMenu().isEmpty());
  }

  @Test
  public void addAndRemoveItemsFromMenu() {
    var menu = new Menu();
    Dish dish1 = mock(Dish.class);
    Dish dish2 = mock(Dish.class);
    Dish dish3 = mock(Dish.class);
    Dish dish4 = mock(Dish.class);

    when(dish1.getId()).thenReturn(0);
    when(dish2.getId()).thenReturn(3);
    when(dish3.getId()).thenReturn(10);
    when(dish4.getId()).thenReturn(13);

    menu.addDish(dish1);
    menu.addDish(dish2);
    menu.addDish(dish3);
    menu.addDish(dish4);

    menu.removeDish(dish2);

    assertEquals(3, menu.getMenu().size());

    menu.removeDish(dish3);

    assertEquals(2, menu.getMenu().size());

    menu.removeDish(dish1);
    menu.removeDish(dish4);

    assertTrue(menu.getMenu().isEmpty());
  }
}
