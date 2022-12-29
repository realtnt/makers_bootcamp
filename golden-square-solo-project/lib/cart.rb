class Cart
  def initialize
    @items = []
  end

  def add_item(cart_item)
    fail 'Invalid cart item data' unless cart_item.name.is_a?(String) && cart_item.price.is_a?(Float)
    @items << cart_item
  end

  def remove_item(cart_item)
    @items.delete_at(@items.index(cart_item))
  end

  def get_items
    @items
  end
end