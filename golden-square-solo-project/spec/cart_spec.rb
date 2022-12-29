require 'cart'

RSpec.describe Cart do
  context 'Adding and removing items to/from a cart' do
    it 'should return a list of cart items' do
      cart = Cart.new
      cart_item_1 = double :CartItem, name: 'Fake Cart Item 1', price: 8.99
      cart_item_2 = double :CartItem, name: 'Fake Cart Item 2', price: 1.99
      cart_item_3 = double :CartItem, name: 'Fake Cart Item 3', price: 3.99
      cart.add_item(cart_item_1)
      cart.add_item(cart_item_2)
      cart.add_item(cart_item_3)
      expect(cart.get_items).to eq [cart_item_1, cart_item_2, cart_item_3]
      cart.remove_item(cart_item_3)
      expect(cart.get_items).to eq [cart_item_1, cart_item_2]
      cart.add_item(cart_item_3)
      cart.add_item(cart_item_3)
      cart.add_item(cart_item_3)
      cart.remove_item(cart_item_3)
      expect(cart.get_items).to eq [cart_item_1, cart_item_2, cart_item_3, cart_item_3]
    end
  end
  context 'Attempting to add items with invalid data to the menu' do
    it 'should raise an error: Invalid cart item data' do
      cart = Cart.new
      cart_item_1 = double :CartItem, name: 'Fake Item 1', price: '8.99'
      expect{cart.add_item(cart_item_1)}.to raise_error 'Invalid cart item data'
      dish_1 = double :CartItem, name: nil, price: 8.99
      expect{cart.add_item(cart_item_1)}.to raise_error 'Invalid cart item data'
      dish_1 = double :CartItem, name: false, price: true
      expect{cart.add_item(cart_item_1)}.to raise_error 'Invalid cart item data'
    end
  end
end