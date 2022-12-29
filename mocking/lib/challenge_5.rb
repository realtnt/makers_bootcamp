
class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts 'Hello. I will repeat a string many times.'
    @io.puts 'Please enter a string'
    string = @io.gets.chomp
    @io.puts 'Please enter a number of repeats'
    repeats = @io.gets.chomp
    @io.puts 'Here is your result:'
    @io.puts string * repeats.to_i
  end
end

string_repeater = StringRepeater.new(Kernel)
string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX