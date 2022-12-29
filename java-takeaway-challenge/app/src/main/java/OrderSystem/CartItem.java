package OrderSystem;

public class CartItem {
  private String name;
  private Double pricePerItem;
  private Double totalPrice;
  private Integer quantity;
  private Integer id;

  public CartItem(Dish dish, Integer quantity) {
    this.name = dish.getName();
    this.pricePerItem = dish.getPrice();
    this.quantity = quantity;
    this.totalPrice = this.pricePerItem * quantity;
    this.id = null;
  }

  public String getName() {
    return name;
  }

  public Double getPrice() {
    return totalPrice;
  }

  public Integer getQuantity() {
    return quantity;
  }

  public Integer getId() {
    return id;
  }

  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
    this.totalPrice = this.pricePerItem * quantity;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
