package OrderSystem;

import java.time.format.DateTimeFormatter;

public class OrderFormatter {
  private Order order;

  public OrderFormatter(Order order) {
    this.order = order;
  }

  public void renderOrder() {
    CartFormatter formatter = new CartFormatter(order.getCart());
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("EEE dd-MM-yy HH:mm");

    formatter.renderCart();
    System.out.println(order.getOrderTime().format(timeFormatter));
  }
}
