public class App {
  public static class Fizzbuzz {
    public String play(Integer number) {
      // remove othernumber
      if (this.isDivisibleBy(15, number)) {
        return "FizzBuzz";
      } else if (this.isDivisibleBy(5, number)) {
        return "Buzz";
      } else if (this.isDivisibleBy(3, number)) {
        return "Fizz";
      } else {
        return number.toString(); // add .toString();
      }
    }

    public Boolean isDivisibleBy(Integer divisor, Integer number) { // change Double to Boolean and String number to
                                                                    // Integer number
      return number % divisor == 0; // change + to %
    }
  }

  public static void main(String[] args) {
    App.Fizzbuzz fizzbuzz = new Fizzbuzz(); // change new Fizzbuzz();

    for (int i = 1; i < 100; i++) {
      System.out.println(fizzbuzz.play(i)); // change 5 to i
    }
  }
}