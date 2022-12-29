package shoppinglist;

public class ShoppingItem {
  private String name;
  private Double price;

  public ShoppingItem(String name, Double price) {
    this.name = name;
    this.price = price;
  }

  public String getName() {
    return name;
  }

  public Double getPrice() {
    return price;
  }

}
