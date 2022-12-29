class InteractiveCalculator
  def initialize(io=Kernel)
    @io = io
  end

  def run
    @io.puts 'Hello. I will subtract two numbers.'
    @io.puts 'Please enter a number '
    num1 = @io.gets.chomp
    @io.puts 'Please enter another number '
    num2 = @io.gets.chomp
    @io.puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
  end
end



interactive_calculator = InteractiveCalculator.new(Kernel)
interactive_calculator.run


# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1