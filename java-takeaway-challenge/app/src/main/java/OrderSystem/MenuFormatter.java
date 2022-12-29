package OrderSystem;

public class MenuFormatter {
  private Menu menu;

  public MenuFormatter(Menu menu) {
    this.menu = menu;
  }

  public void renderMenu() {
    for (Dish dish : menu.getMenu()) {
      System.out.printf("%s: £%.2f\n", dish.getName(), dish.getPrice());
    }
  }
}
