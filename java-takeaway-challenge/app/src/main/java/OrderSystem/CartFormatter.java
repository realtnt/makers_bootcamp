package OrderSystem;

public class CartFormatter {
  private Cart cart = new Cart();

  public CartFormatter(Cart cart) {
    this.cart = cart;
  }

  public void renderCart() {
    for (CartItem item : cart.getItems()) {
      System.out.printf("%d x %s: £%.2f\n", item.getQuantity(), item.getName(), item.getPrice());
    }
  }
}
