package OrderSystem;

public class Customer {
  private String name;
  private String address;
  private String mobile;

  public Customer(String name, String address, String mobile) {
    this.name = name;
    this.address = address;
    this.mobile = mobile;
  }

  public String getName() {
    return name;
  }

  public String getAddress() {
    return address;
  }

  public String getMobile() {
    return mobile;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }
}
