/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package PriceDisplay;

public class PriceDisplay {
  public String getPriceLabel(String name, Double price) {
    return String.format("%s: £%.2f", name, price);
  }

  // public static void main(String[] args) {
  // System.out.println(new Pric().getGreeting());
  // }
}
