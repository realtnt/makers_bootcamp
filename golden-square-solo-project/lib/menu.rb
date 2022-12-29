require 'dish'

class Menu
  def initialize
    @dishes = []
  end

  def add_dish(dish)
    fail 'Invalid dish data' unless dish.name.is_a?(String) && dish.price.is_a?(Float)
    @dishes << dish
  end

  def remove_dish(dish)
    @dishes.delete(dish)
  end

  def get_menu
    @dishes
  end
end