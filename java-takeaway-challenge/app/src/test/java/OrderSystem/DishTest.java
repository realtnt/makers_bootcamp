package OrderSystem;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class DishTest {
  @Test
  public void addDishAndGetNameAndPrice() {
    Dish dish = new Dish("Pasta", 4.99);

    assertEquals("Pasta", dish.getName());
    assertEquals(Double.valueOf(4.99), dish.getPrice());
  }

  @Test
  public void setDishName() {
    Dish dish = new Dish("Pasta", 4.99);

    dish.setName("Macaroni");

    assertEquals("Macaroni", dish.getName());
    assertEquals(Double.valueOf(4.99), dish.getPrice());
  }

  @Test
  public void setDishPrice() {
    Dish dish = new Dish("Pasta", 4.99);

    dish.setPrice(3.99);

    assertEquals("Pasta", dish.getName());
    assertEquals(Double.valueOf(3.99), dish.getPrice());
  }

  @Test
  public void setId() {
    Dish dish = new Dish("Pasta", 4.99);

    assertNull(dish.getId());

    dish.setId(1);
    assertEquals(Integer.valueOf(1), dish.getId());
  }

}
