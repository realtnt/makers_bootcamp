print "Hey there! What's your name? "
name = gets.chomp

name.chr == 'S' ? (puts name.upcase) : (puts "Hi #{name}!")