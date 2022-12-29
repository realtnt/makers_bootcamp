package OrderSystem;

import java.util.ArrayList;

public class Menu {
  private ArrayList<Dish> menu = new ArrayList<Dish>();

  public ArrayList<Dish> getMenu() {
    return menu;
  }

  public void addDish(Dish dish) {
    menu.add(dish);
  }

  public void removeDish(Dish dish) {
    menu.remove(dish);
  }
}
