package OrderSystem;

public class Dish {
  private static Integer autoIncrement = 0;
  private String name;
  private Double price;
  private Integer id;

  public Dish(String name, Double price) {
    this.name = name;
    this.price = price;
    this.id = ++autoIncrement;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setPrice(Double price) {
    this.price = price;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public Double getPrice() {
    return price;
  }

  public Integer getId() {
    return this.id;
  }

}
