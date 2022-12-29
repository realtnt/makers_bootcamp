package OrderSystem;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CustomerTest {
  @Test
  public void createCustomerAndGetName() {
    Customer customer = new Customer("Jim Bob", "1 High Street", "07777111111");
    assertEquals("Jim Bob", customer.getName());
  }

  @Test
  public void createCustomerAndGetAddress() {
    Customer customer = new Customer("Jim Bob", "1 High Street", "07777111111");
    assertEquals("1 High Street", customer.getAddress());
  }

  @Test
  public void createCustomerAndGetMobile() {
    Customer customer = new Customer("Jim Bob", "1 High Street", "07777111111");
    assertEquals("07777111111", customer.getMobile());
  }

  @Test
  public void changeNameAddressMobile() {
    Customer customer = new Customer("Jim Bob", "1 High Street", "07777111111");

    customer.setName("James Robert");
    customer.setAddress("2 High Street");
    customer.setMobile("07777222222");
    assertEquals("James Robert", customer.getName());
    assertEquals("2 High Street", customer.getAddress());
    assertEquals("07777222222", customer.getMobile());
  }
}
