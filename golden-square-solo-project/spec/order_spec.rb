require 'order'

RSpec.describe Order do
  context 'Submitting an order' do
    it 'should return true when submitted' do
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      cart_item_2 = double :CartItem, name: 'Fake Dish 2',price: 1.99
      cart_item_3 = double :CartItem, name: 'Fake Dish 3',price: 3.99
      allow(cart).to receive(:get_items).and_return([cart_item_1, cart_item_2, cart_item_3])
      customer = double :Customer
      order = Order.new(customer, cart)
      expect(order.submit).to eq true
    end
  end
  context 'After submitting the order' do
    it 'should return a customer object' do
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      customer = double :Customer, full_name: 'Jim Bob', address: '1 First St', mobile: '+447777111222'
      order = Order.new(customer, cart)
      expect(order.customer).to eq customer
    end
  end
  context 'After submitting the order' do
    it 'should return a cart object' do
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      customer = double :Customer, full_name: 'Jim Bob', address: '1 First St', mobile: '+447777111222'
      order = Order.new(customer, cart)
      expect(order.cart).to eq cart
    end
  end
  context 'After submitting the order' do
    it 'should return the time the order was submitted' do
      time_dbl = double :time
      delivery_time = DeliveryTime.new(time_dbl)
      expect(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,17,17,00))
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      customer = double :Customer, full_name: 'Jim Bob', address: '1 First St', mobile: '+447777111222'
      order = Order.new(customer, cart, time_dbl)
      order.submit
      expect(order.date_time).to eq '10/05/2022, 17:17'
    end
    it 'should fail if the order was NOT submitted' do
      time_dbl = double :time
      delivery_time = DeliveryTime.new(time_dbl)
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      customer = double :Customer, full_name: 'Jim Bob', address: '1 First St', mobile: '+447777111222'
      order = Order.new(customer, cart, time_dbl)
      expect{order.date_time}.to raise_error 'Order not submitted!'
    end
  end
end