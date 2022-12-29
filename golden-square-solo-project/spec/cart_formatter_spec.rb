require 'cart_formatter'

RSpec.describe CartFormatter do
  context 'Adding items to the cart' do
    it 'should return a formatted string of all the dishes' do
      cart = double :Cart
      cart_item_1 = double :CartItem, name: 'Cart Item 1', price: 8.99
      cart_item_2 = double :CartItem, name: 'Cart Item 2', price: 1.99
      cart_item_3 = double :CartItem, name: 'Cart Item 3', price: 3.99
      allow(cart).to receive(:get_items).and_return([cart_item_1, cart_item_2, cart_item_3])
      cart_formatter = CartFormatter.new(cart)
      expect(cart_formatter.format).to eq "1. Cart Item 1: £8.99\n2. Cart Item 2: £1.99\n3. Cart Item 3: £3.99\nTotal: £14.97"
    end
  end
end