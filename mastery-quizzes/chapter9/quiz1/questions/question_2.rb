# Define a method called add, that
# - takes two numbers as arguments
# - and adds them together
# - then returns the new value
#

def add(num1, num2)
  return num1 + num2
end

# Define a method called subtract, that
# - takes two numbers as arguments
# - and subtract the second number from the first
# - then returns the new value
#

def subtract(num1, num2)
  return num1 - num2
end

# Define a method called multiply, that
# - takes two numbers as arguments
# - multiplies one by the other
# - then returns the new value
#

def multiply(num1, num2)
  return num1 * num2
end

# Define a method called divide, that
# - takes two numbers as arguments
# - and divides the first number by the second
# - then returns the new value
#

def divide(num1, num2)
  return num1 / num2
end

# Define a method called sqaure, that
# - takes a number as an argument
# - squares the number, using the multiply method
# - then returns the new value

def square(num)
  return multiply(num, num)
end