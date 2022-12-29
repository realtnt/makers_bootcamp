$LOAD_PATH << './lib'
require 'require_all'

require_all 'lib'

RSpec.describe 'Ordering System Integration' do
  context 'Adding items to the menu' do
    menu = Menu.new
    dish_1 = Dish.new('Dish 1', 8.99)
    dish_2 = Dish.new('Dish 2', 1.99)
    dish_3 = Dish.new('Dish 3', 3.99)
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_3)
    it 'should return an array of dishes' do
      expect(menu.get_menu).to eq [dish_1, dish_2, dish_3]
    end
    it 'should return a formatted string of all the dishes' do
      menu_formatter = MenuFormatter.new(menu)
      expect(menu_formatter.format).to eq "1. Dish 1: £8.99\n2. Dish 2: £1.99\n3. Dish 3: £3.99"
    end
  end

  context 'Adding items to the cart' do
    cart = Cart.new
    cart_item_1 = CartItem.new('Cart Item 1', 8.99)
    cart_item_2 = CartItem.new('Cart Item 2', 1.99)
    cart_item_3 = CartItem.new('Cart Item 3', 3.99)
    cart.add_item(cart_item_1)
    cart.add_item(cart_item_2)
    cart.add_item(cart_item_3)
    it 'should return an array of cart_items' do
      expect(cart.get_items).to eq [cart_item_1, cart_item_2, cart_item_3]
    end
    it 'should return a formatted string of all the dishes' do
      cart_formatter = CartFormatter.new(cart)
      expect(cart_formatter.format).to eq "1. Cart Item 1: £8.99\n2. Cart Item 2: £1.99\n3. Cart Item 3: £3.99\nTotal: £14.97"
    end
  end

  context 'Creating an order' do
    it 'should render the order' do
      cart = Cart.new
      cart_item_1 = CartItem.new('Dish 1', 8.99)
      cart_item_2 = CartItem.new('Dish 2', 1.99)
      cart_item_3 = CartItem.new('Dish 3', 3.99)
      cart.add_item(cart_item_1)
      cart.add_item(cart_item_2)
      cart.add_item(cart_item_3)
      customer = Customer.new('Jim Bob', '1 First St', '+447777111222')
      time_dbl = double :time
      expect(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,17,17,00))
      order = Order.new(customer, cart, time_dbl)
      order.submit
      order_formatter = OrderFormatter.new(order)
      expect(order_formatter.format).to eq "Customer: Jim Bob\nAddress: 1 First St\nMobile: +447777111222\nDate: 10/05/2022, 17:17\n1. Dish 1: £8.99\n2. Dish 2: £1.99\n3. Dish 3: £3.99\nTotal: £14.97"
    end
  end

  context 'When sending an SMS' do
    it 'should return the message as a string' do
      cart = Cart.new
      cart_item_1 = CartItem.new('Dish 1', 8.99)
      cart_item_2 = CartItem.new('Dish 2', 1.99)
      cart_item_3 = CartItem.new('Dish 3', 3.99)
      cart.add_item(cart_item_1)
      cart.add_item(cart_item_2)
      cart.add_item(cart_item_3)
      customer = Customer.new('Jim Bob', '1 First St', '+447777111222')
      time_dbl = double :time
      allow(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,17,17,00))
      order = Order.new(customer, cart, time_dbl)
      order.submit
      delivery_time = DeliveryTime.new(time_dbl)
      sms_text = DeliveryTextFormatter.new(order, delivery_time)
      expect(sms_text.format).to eq 'Thank you! Your order was placed and will be delivered before 17:47'
    end
  end
end
