# Show welcome message
# Ask name
# Show available options (left, right, forward)
# If the user moves left they are killed by a goblin
# If the user moves right they are killed by a werewolf
# If the user moves forward they live
# If user input is not understood show options again.
# Show available options (left, right, forward)
# If the user moves left they are killed by a goblin
# If the user moves right they are killed by a werewolf
# If the user moves forward they live
# If user input is not understood show options again.
# Show winning message

VALID_MOVES = ['L', 'R', 'F']
game_finished = false
steps = 0

puts "\n\nWelcome to Dungeon Explorer v0.01\n\n"
print "What is your name valiant adventurer? "
name = gets.chomp

while not game_finished do

  while true do
    print "#{name.capitalize} you can go Left, Right, Forward: [select L, R or F] "
    move = gets.chomp
    if VALID_MOVES.include? move.upcase
      break
    else
      puts "Que? "
    end
  end

  case move.upcase
  when 'L'
    puts "Oh no! The ugly goblin got ya! You're so dead!"
    game_finished = true
  when 'R'
    puts "Oh no! The hairy werewolf had you for lunch! Say goodby to this world!"
    game_finished = true
  when 'F'
    steps += 1
    if steps < 2
      puts "You've made it alive this far... Keep going!"
    else
      puts "Taratatatataaaaaa! You WON!"
      game_finished = true
    end

  end

end
