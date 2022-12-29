# Write a program that can be used to play FizzBuzz.  It should
# Have one class called FizzBuzz
# The FizzBuzz class should have four methods
#
# `play_until'
#   * takes a number as it's argument
#   * returns the FizzBuzz sequence up to that number
#
# `divisible_by_three`
#   * takes a number as it's argument
#   * returns true if that number is divisible by three
#
# `divisible_by_five`
#   * takes a number as it's argument
#   * returns true if that number is divisible by five
#
# `divisible_by_fifteen`
#   * takes a number as it's argument
#   * returns true if that number is divisible by fifteen (i.e. both 3 and 5)

class FizzBuzz

  def initialize
    @fizzbuzz_sequence = []
  end

  def play_until(number)
    (1..number).each do |i|
      case
      when divisible_by_fifteen(i)
        @fizzbuzz_sequence << "FizzBuzz"
      when divisible_by_five(i)
        @fizzbuzz_sequence << "Buzz"
      when divisible_by_three(i)
        @fizzbuzz_sequence << "Fizz"
      else
        @fizzbuzz_sequence << i.to_s
      end
    end
    return @fizzbuzz_sequence
  end

  def divisible_by_three(number)
    number % 3 == 0
  end

  def divisible_by_five(number)
    number % 5 == 0
  end

  def divisible_by_fifteen(number)
    number % 15 == 0
  end

end

fizzy = FizzBuzz.new
puts fizzy.divisible_by_fifteen(45)
puts fizzy.divisible_by_five(16)
puts fizzy.divisible_by_three(124)
puts fizzy.play_until(20)