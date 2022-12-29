require 'order_formatter'

RSpec.describe OrderFormatter do
  context 'Creating an order' do
    it 'should render the order' do
      order_cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Fake Dish 1',price: 8.99
      cart_item_2 = double :CartItem, name: 'Fake Dish 2',price: 1.99
      cart_item_3 = double :CartItem, name: 'Fake Dish 3',price: 3.99
      allow(order_cart).to receive(:get_items).and_return([cart_item_1, cart_item_2, cart_item_3])
      order_customer = double :Customer, full_name: 'Jim Bob', address: '1 First St', mobile: '+447777111222'
      order = double :Order, customer: order_customer, cart: order_cart
      order_formatter = OrderFormatter.new(order)
      allow(order).to receive(:date_time).and_return('10/05/2022, 17:17')
      expect(order_formatter.format).to eq "Customer: Jim Bob\nAddress: 1 First St\nMobile: +447777111222\nDate: 10/05/2022, 17:17\n1. Fake Dish 1: £8.99\n2. Fake Dish 2: £1.99\n3. Fake Dish 3: £3.99\nTotal: £14.97"
    end
  end
end