class String
  def say_hi
    "Hi there!"
  end

  def say_hi_to(name)
    "Hi there #{name}!"
  end
end

my_obj = "Hey hey hey"
puts my_obj.say_hi_to("James")
puts my_obj.say_hi
puts my_obj

class Array
  def average
    self.sum / self.length
  end
end

puts [1, 2, 3].average