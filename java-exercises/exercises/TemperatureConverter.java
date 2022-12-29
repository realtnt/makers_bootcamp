// TemperatureConverter.java

public class TemperatureConverter {
  public static void main(String[] args) {
    TemperatureConverter converter = new TemperatureConverter();

    Double fahrenheit = 60.0;
    System.out.printf("%f in fahrenheit = %f in celsius\n", fahrenheit, converter.toCelsius(fahrenheit));

    Double celsius = 27.0;
    System.out.printf("%f in celsius = %f in fahrenheit\n", celsius, converter.toFahrenheit(celsius));
  }

  public Double toCelsius(double fahrenheit) {
    Double factor = (5.0 / 9.0);
    return (fahrenheit - 32) * factor;
  }

  public Double toFahrenheit(double celsius) {
    double factor = (9.0 / 5.0);
    return celsius * factor + 32;
  }
}
