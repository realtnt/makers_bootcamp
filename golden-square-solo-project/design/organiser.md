# Ordering System Design

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

# Solo Project

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

_Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?_s


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```


```

_Also design the interface of each class in more detail._

```ruby

Customer = Struct.new(:full_name, :address, :mobile)

Dish = Struct.new(:name, :price)

CartItem = Struct.new(:name, :price)

class Order
  attr_reader :submitted

  def initialize(customer, cart)
    @customer = customer
    @cart = cart
    @date_time = Time.now
    @submitted = false
  end

  def submit
    # sends a text to the customer

    # sends order to kitchen, ie @submitted = true
  end

  def customer
    # returns the customer object
  end

  def cart
    # returns the cart object
  end

  def date_time
    # returns the date and time as String
  end

  def get_order_time
    # returns the order time as a Time object
  end
end

class Cart
  def initialize
    @items = []
  end

  def add_item(cart_item) # cart_item is an instance of CartItem
    # adds an item in the cart
  end

  def remove_item(cart_item) # cart_item is an instance of CartItem
    # removes an item from the cart
  end

  def get_items
    # returns an array of all the cart items
  end
end

class Menu
  def initialize
    @dishes = []
  end

  def add_dish(dish) # dish is an instance of Dish
    # adds a dish to the menu
  end

  def remove_dish(dish) # dish is an instance of Dish
    # removes a dish from the menu
  end

  def get_menu
    # returns an array of all the menu items
  end
end

class CartFormatter
  def initialize(cart) # cart is an instance of Cart
    @cart = cart
  end

  def show_cart
    # returns the cart as a formatted string
  end
end

class OrderFormatter
  def initialize(order) # order is an instance of Order
    @order = order
  end

  def format
    # returns the order as a formatted string
  end
end

class MenuFormatter
  def initialize(menu) # order is an instance of Menu
    @menu = menu
  end

  def format
    # returns the menu as a formatted string
  end
end

class TextService
  def send_text
    fail 'Method not implemented'
  end
end

class Twilio < TextService
  def initialize(api_key, text, mobile)
    @api_key = api_key
    @text = text
    @mobile = mobile
  end

  def send_text
    # sends the text using Twilio
    # returns nothing ???? or true/false for success/failure??
  end
end

class TextSender
  def initialize(text, service) # text to send, 
                                # service is an instance of TextService
    @text = text
    @service = service
  end

  def send
    # calls the TextService's send_text method to send the text
  end
end

class DeliveryTime
  def get_delivery_time 
    # returns an integer which is the
    # delivery time (in minutes) 
    # This time depends on the time of day
  end
end

class DeliveryTextFormatter
  def initialize
    @delivery_time = DeliveryTime.new
  end

  def format
    # formats a text with the estimated delivery time
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Get the menu
menu = Menu.new
dish_1 = Dish.new('Dish 1', 8.99)
dish_2 = Dish.new('Dish 2', 1.99)
dish_3 = Dish.new('Dish 3', 3.99)
menu.add_dish(dish_1)
menu.add_dish(dish_2)
menu.add_dish(dish_3)
menu.get_items # => [dish_1, dish_2, dish_3]

# Remove dish from the menu
menu.remove_dish(dish_3)
menu.get_menu # => [dish_1, dish_2]

# Render the menu (MenuFormatter)
menu_formatter = MenuFormatter.new(menu)
menu_formatter.format # => 'Dish 1: £8.99\nDish 2: £1.99\nDish 3: £3.99'

# Remove dish not in the menu
menu.remove_dish(dish_3)
menu.get_items # => [dish_1, dish_2]

# Get the cart
cart = Cart.new
cart_item_1 = CartItem.new('Dish 1', 8.99)
cart_item_2 = CartItem.new('Dish 2', 1.99)
cart_item_3 = CartItem.new('Dish 3', 3.99)
cart.add_item(cart_item_1)
cart.add_item(cart_item_2)
cart.add_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2, cart_item_3]

# Remove item from the cart
cart.remove_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2]

# Render the cart (CartFormatter)
cart_formatter = CartFormatter.new(cart)
cart_formatter.format # => 'Dish 1: £8.99\nDish 2: £1.99\nTotal: £10.98'

# Remove item not in the cart
cart.remove_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2]

# Create an order
cart = Cart.new
cart_item_1 = CartItem.new('Dish 1', 8.99)
cart_item_2 = CartItem.new('Dish 2', 1.99)
cart_item_3 = CartItem.new('Dish 3', 3.99)
cart.add_item(cart_item_1)
cart.add_item(cart_item_2)
cart.add_item(cart_item_3)
customer = Customer.new('Jim Bob', '1 First St', '07777 777777')
order = Order.new(customer, cart)
order.submit
order.submitted # => true

# Render the order (OrderFormatter)
order_formatter = OrderFormatter.new(order)
order_formatter.format # => 'Date: 01/01/2022\nDish 1: £8.99\nDish 2: £1.99\nDish 3: £3.99\nTotal: £14.97

# Formatting text to send via SMS
sms_text = DeliveryTextFormatter.new
sms_text.format
# => 'Thank you! Your order was placed and will be delivered before 18:52'


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# class DeliveryTime
delivery_time = DeliveryTime.new
delivery_time.get_delivery_time 
# => 30mins between 5pm-7pm, 45mins 7pm-9pm, 35mins 9pm-11pm

# class Twilio
twilio = Twilio.new(api_key, text, mobile)
twilio.send_text

# class TextSender
text_sender = TextSender(text)
text_sender.send

# class DeliveryTextFormatter
sms_text = DeliveryTextFormatter.new
sms_text.format
# => 'Thank you! Your order was placed and will be delivered before 18:52'

# class Cart
cart = Cart.new
cart_item_1 = CartItem.new('Dish 1', 8.99)
cart_item_2 = CartItem.new('Dish 2', 1.99)
cart_item_3 = CartItem.new('Dish 3', 3.99)
cart.add_item(cart_item_1)
cart.add_item(cart_item_2)
cart.add_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2, cart_item_3]

# Remove item from the cart
cart.remove_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2]

# Remove item not in the cart
cart.remove_item(cart_item_3)
cart.get_items # => [cart_item_1, cart_item_2]

# class CartFormatter

# Render the cart (CartFormatter)
cart_formatter = CartFormatter.new(cart)
cart_formatter.format # => 'Dish 1: £8.99\nDish 2: £1.99\nTotal: £10.98'

# class Order

# Create an order
cart = Cart.new
cart_item_1 = CartItem.new('Dish 1', 8.99)
cart_item_2 = CartItem.new('Dish 2', 1.99)
cart_item_3 = CartItem.new('Dish 3', 3.99)
cart.add_item(cart_item_1)
cart.add_item(cart_item_2)
cart.add_item(cart_item_3)
customer = Customer.new('Jim Bob', '1 First St', '07777 777777')
order = Order.new(customer, cart)
order.submit
order.submitted # => true

# class OrderFormatter

# Render the order (OrderFormatter)
order_formatter = OrderFormatter.new(order)
order_formatter.format # => 'Date: 01/01/2022\nDish 1: £8.99\nDish 2: £1.99\nDish 3: £3.99\nTotal: £14.97

# class Menu

# Get the menu
menu = Menu.new
dish_1 = Dish.new('Dish 1', 8.99)
dish_2 = Dish.new('Dish 2', 1.99)
dish_3 = Dish.new('Dish 3', 3.99)
menu.add_dish(dish_1)
menu.add_dish(dish_2)
menu.add_dish(dish_3)
menu.get_items # => [dish_1, dish_2, dish_3]

# Remove dish from the menu
menu.remove_dish(dish_3)
menu.get_items # => [dish_1, dish_2]

# Remove dish not in the menu
menu.remove_dish(dish_3)
menu.get_items # => [dish_1, dish_2]

# class MenuFormatter

# Render the menu (MenuFormatter)
menu_formatter = MenuFormatter.new(menu)
menu_formatter.format # => 'Dish 1: £8.99\nDish 2: £1.99\nDish 3: £3.99'

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
