DICTIONARY = {
  :bear => "a creature that fishes in the river for salmon",
  :river => "a body of water that contains salmon, and sometimes bears.",
  :salmon => "a fish, sometimes in a river, sometimes in a bear, and sometimes in both."
}

while true do
  print "Gimme a word (q to quit): "
  response = gets.chomp.downcase

  if response == 'q'
    break
  elsif DICTIONARY.key?(response.to_sym)
    puts DICTIONARY[response.to_sym]
  else
    puts "Huh???"
  end
end
    