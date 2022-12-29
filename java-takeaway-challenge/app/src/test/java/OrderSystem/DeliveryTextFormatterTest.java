package OrderSystem;

import static org.junit.Assert.assertEquals;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.junit.Test;

public class DeliveryTextFormatterTest {

  @Test
  public void getCorrectlyFormattedTextWithTime() {
    Clock clock = Clock.fixed(Instant.parse("2022-01-01T00:00:00.00Z"), ZoneId.of("UTC"));
    LocalDateTime orderTime = LocalDateTime.now(clock);
    DeliveryTextFormatter formatter = new DeliveryTextFormatter(orderTime);
    String expected = "Thank you! Your order was placed and will be delivered before 01:00";

    String actual = formatter.renderText();

    assertEquals(expected, actual);
  }
}
