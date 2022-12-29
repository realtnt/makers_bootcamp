package OrderSystem;

import java.util.ArrayList;

public class Cart {
  private ArrayList<CartItem> items = new ArrayList<CartItem>();

  public ArrayList<CartItem> getItems() {
    return items;
  }

  public void addItem(CartItem item) {
    items.add(item);
  }

  public void removeItem(CartItem item) {
    Integer quantity = item.getQuantity();
    if (quantity == 1) {
      items.remove(item);
    } else {
      quantity--;
      item.setQuantity(quantity);
    }
  }
}
