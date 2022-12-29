class OrderFormatter
  def initialize(order) # order is an instance of Order
    @order = order
  end

  def format
    output = "Customer: #{@order.customer.full_name}\n"
    output += "Address: #{@order.customer.address}\n"
    output += "Mobile: #{@order.customer.mobile}\n"
    output += "Date: #{@order.date_time}\n"
    output += @order.cart.get_items.map.with_index{|item, i| "#{i+1}. #{item.name}: £#{item.price}"}.join("\n")
    output += "\n"
    output += "Total: £#{'%.2f' % @order.cart.get_items.sum{|item| item.price}}"
  end
end