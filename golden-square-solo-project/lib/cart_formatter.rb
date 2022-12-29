class CartFormatter
  def initialize(cart)
    @cart = cart
  end

  def format
    formatted_output = @cart.get_items.map.with_index{|item, i| "#{i+1}. #{item.name}: £#{item.price}"}.join("\n")
    formatted_output += "\n"
    formatted_output += "Total: £#{'%.2f' % @cart.get_items.sum{|item| item.price}}"
    return formatted_output
  end
end