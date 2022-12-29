$LOAD_PATH << './lib'
require 'require_all'

require_all 'lib'

menu = Menu.new
dishes = [
  Dish.new('Dish 1', 8.99),
  Dish.new('Dish 2', 1.99),
  Dish.new('Dish 3', 3.99)
]
dishes.map{|dish| menu.add_dish(dish)}
menu_formatter = MenuFormatter.new(menu)

cart_items = []
cart = Cart.new
cart_formatter = CartFormatter.new(cart)
while true
  puts
  puts 'MENU'
  puts '----'
  puts menu_formatter.format
  puts
  print 'Choose dish number to add to order, R to remove or N for next step: '
  user_response = gets.chomp
  if user_response.downcase == 'n'
    break
  elsif user_response.downcase == 'r'
    puts
    puts 'Your cart contents:'
    puts '-------------------'
    puts cart_formatter.format
    while true
      print 'Choose dish number to remove or B to go back: '
      remove_dish = gets.chomp
      if remove_dish.downcase == 'b'
        break
      elsif remove_dish.to_i.to_s == remove_dish
        cart.remove_item(cart_items.delete_at(remove_dish.to_i - 1))
        break
      end
    end
  elsif
    cart_items << CartItem.new(dishes[user_response.to_i - 1].name, dishes[user_response.to_i - 1].price)
    cart.add_item(cart_items.last)
  end
end

puts 'Your cart contents:'
puts '-------------------'
puts cart_formatter.format
puts
puts 'Please enter your details:'
puts '--------------------------'
print 'What is your name? '
full_name = gets.chomp
print 'Where do you live? '
address = gets.chomp
print 'What is your mobile number? '
mobile = gets.chomp
customer = Customer.new(full_name, address, mobile)
order = Order.new(customer, cart)
order_formatter = OrderFormatter.new(order)
puts
puts 'Your cart contents:'
puts '-------------------'
puts cart_formatter.format

puts
print 'Please confirm your order (y/n): '
confirm_order = gets.chomp

if confirm_order.downcase == 'y'
  order.submit
  puts
  puts 'Your order details:'
  puts '-------------------'
  puts order_formatter.format
  delivery_text_formatter = DeliveryTextFormatter.new(order)
  text_sender = TextSender.new(delivery_text_formatter.format, customer.mobile)
  text_sender.send
else
  puts 'Order cancelled!'
  puts 'Thank you!'
end