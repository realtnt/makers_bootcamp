class MenuFormatter
  def initialize(menu)
    @menu = menu
  end

  def format
    @menu.get_menu.map.with_index{|menu_item, i| "#{i+1}. #{menu_item.name}: £#{menu_item.price}"}.join("\n")
  end
end