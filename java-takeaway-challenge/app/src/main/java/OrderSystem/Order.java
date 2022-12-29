package OrderSystem;

import java.time.Clock;
import java.time.LocalDateTime;

public class Order {
  private Cart cart;
  private Customer customer;
  private LocalDateTime orderTime;

  public Order(Cart cart, Customer customer) {
    this.cart = cart;
    this.customer = customer;
    orderTime = null;
  }

  public LocalDateTime getOrderTime() {
    return orderTime;
  }

  public void submit(Clock clock) {
    orderTime = LocalDateTime.now(clock);
  }

  public Customer getCustomer() {
    return customer;
  }

  public Cart getCart() {
    return cart;
  }
}
