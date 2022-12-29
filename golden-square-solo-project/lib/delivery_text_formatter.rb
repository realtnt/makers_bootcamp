class DeliveryTextFormatter
  def initialize(order, delivery_time = DeliveryTime.new)
    @delivery_time = delivery_time.get_delivery_time
    @order = order
  end

  def format
    message = 'Thank you! Your order was placed and will be delivered before '
    message += "#{(@order.get_order_time + @delivery_time*60).strftime("%k:%M")}"
  end
end