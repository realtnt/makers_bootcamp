class Dog
  def bark
    "woof!"
  end

  def howl
    "howwwwwwwllll!"
  end

  def colour=(colour)
    @colour = colour
  end

  def observe
    return "You see a #{@colour} dog."
  end
end

fido = Dog.new
dido = Dog.new

fido.colour = "green"
dido.colour = "blue"

puts fido.bark
puts fido.observe


