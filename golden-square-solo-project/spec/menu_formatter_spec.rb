require 'menu_formatter'

RSpec.describe MenuFormatter do
  context '' do
    it 'should return a formatted string of all the dishes' do
      menu = double :Menu
      dish_1 = double :Dish, name: 'Fake Dish 1', price: 8.99
      dish_2 = double :Dish, name: 'Fake Dish 2', price: 1.99
      dish_3 = double :Dish, name: 'Fake Dish 3', price: 3.99
      expect(menu).to receive(:get_menu).and_return([dish_1, dish_2, dish_3])
      menu_formatter = MenuFormatter.new(menu)
      expect(menu_formatter.format).to eq "1. Fake Dish 1: £8.99\n2. Fake Dish 2: £1.99\n3. Fake Dish 3: £3.99"
    end
  end
end