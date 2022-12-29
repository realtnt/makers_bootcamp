class Order
  attr_reader :submitted

  def initialize(customer, cart, time = Time)
    @customer = customer
    @cart = cart
    @date_time = 0
    @submitted = false
    @time = time
  end

  def submit
    fail if @submitted
    # sends a text to the customer
    @date_time = @time.now
    @submitted = true  # sends order to kitchen
  end

  def customer
    @customer
  end

  def cart
    @cart
  end

  def date_time
    fail 'Order not submitted!' if @date_time == 0
    @date_time.strftime("%d/%m/%Y, %k:%M")
  end

  def get_order_time
    @date_time
  end
end