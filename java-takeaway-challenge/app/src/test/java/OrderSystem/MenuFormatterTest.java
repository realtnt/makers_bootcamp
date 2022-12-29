package OrderSystem;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import org.junit.Test;

public class MenuFormatterTest {

  @Test
  public void renderMenu() {
    Menu menu = new Menu();
    Dish dish1 = new Dish("Souvlaki", 5.99);
    Dish dish2 = new Dish("Mousakas", 9.99);
    MenuFormatter formatter = new MenuFormatter(menu);

    menu.addDish(dish1);
    menu.addDish(dish2);

    String expected = "Souvlaki: £5.99\n" +
        "Mousakas: £9.99\n";
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PrintStream printStream = new PrintStream(baos);
    System.setOut(printStream);

    formatter.renderMenu();

    String[] lines = baos.toString().split(System.lineSeparator());
    String actual = lines[0] + "\n" + lines[1] + "\n";

    assertEquals(2, lines.length);
    assertEquals(expected, actual);
  }
}
