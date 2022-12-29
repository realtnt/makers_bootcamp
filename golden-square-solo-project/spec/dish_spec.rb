require 'dish'

RSpec.describe Dish do
  context 'Adding a dish' do
    dish_1 = Dish.new('Dish 1', 8.99)
    it 'should return name and price' do
      expect(dish_1.name).to eq 'Dish 1'
      expect(dish_1.price).to eq 8.99
    end
  end
end