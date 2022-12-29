package shoppinglist;

import java.util.ArrayList;

public class ShoppingList {
  private ArrayList<ShoppingItem> items = new ArrayList<ShoppingItem>();

  public ArrayList<ShoppingItem> getItems() {
    return items;
  }

  public void addItem(ShoppingItem item) {
    items.add(item);
  }

  public static void main(String[] args) {
    ShoppingList shoppingList = new ShoppingList();

    shoppingList.addItem(new shoppinglist.ShoppingItem("Milk", 0.99));
    shoppingList.addItem(new shoppinglist.ShoppingItem("Butter", 1.99));

    for (ShoppingItem item : shoppingList.getItems()) {
      System.out.printf("%s: £%.2f\n", item.getName(), item.getPrice());
    }
  }
}
