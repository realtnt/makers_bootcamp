require 'menu'

RSpec.describe Menu do
  context 'Adding and removing dishes to the menu' do
    it 'should return an array of dishes' do
      menu = Menu.new
      dish_1 = double :Dish, name: 'Fake Dish 1', price: 8.99
      dish_2 = double :Dish, name: 'Fake Dish 2', price: 1.99
      dish_3 = double :Dish, name: 'Fake Dish 3', price: 3.99
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      expect(menu.get_menu).to eq [dish_1, dish_2, dish_3]
      menu.remove_dish(dish_3)
      expect(menu.get_menu).to eq [dish_1, dish_2]
    end
  end
  context 'Attempting to add dishes with invalid data to the menu' do
    it 'should raise an error: Invalid dish data' do
      menu = Menu.new
      dish_1 = double :Dish, name: 'Fake Dish 1', price: '8.99'
      expect{menu.add_dish(dish_1)}.to raise_error 'Invalid dish data'
      dish_1 = double :Dish, name: nil, price: 8.99
      expect{menu.add_dish(dish_1)}.to raise_error 'Invalid dish data'
      dish_1 = double :Dish, name: false, price: true
      expect{menu.add_dish(dish_1)}.to raise_error 'Invalid dish data'
    end
  end
end