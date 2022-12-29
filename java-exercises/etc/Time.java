import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

class Clock {
  public static void main(String[] args) {
    DateTimeFormatter ukFormatter = DateTimeFormatter.ofPattern("HH:mm");
    LocalDateTime now = LocalDateTime.now();
    System.out.printf("The current time is: %s\n", ukFormatter.format(now));
  }
}