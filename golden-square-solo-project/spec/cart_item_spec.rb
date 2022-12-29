require 'cart_item'

RSpec.describe CartItem do
  context 'Constructing a cart item' do
    it 'should return name and price' do
      cart_item = CartItem.new('Cart Item 1', 8.99)
      expect(cart_item.name).to eq 'Cart Item 1'
      expect(cart_item.price).to eq 8.99
    end
  end
end