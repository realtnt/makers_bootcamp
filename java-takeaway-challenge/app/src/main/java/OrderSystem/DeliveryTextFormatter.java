package OrderSystem;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DeliveryTextFormatter {
  LocalDateTime time;

  public DeliveryTextFormatter(LocalDateTime time) {
    this.time = time;
  }

  public String renderText() {
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
    String text;

    LocalDateTime deliveryTime = time.plusHours(1);
    text = String.format("Thank you! Your order was placed and will be delivered before %s",
        deliveryTime.format(timeFormatter));
    return text;
  }

}
