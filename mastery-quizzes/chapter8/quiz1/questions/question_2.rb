# Write a program that can translate these English sentences into Spanish
# * a good developer solves problems in small steps
# * a good developer executes code frequently
# * a great developer is a team player
# * a great developer is a good listener

# Expected behaviour
# The user is prompted to enter a sentence in English
# The program translates the sentence into Spanish
# And prints the translated sentence

# Example
# (prompt)     Enter a sentence in English:
# (user input) a good developer solves problems in small steps
# (output)     un buen desarrollador resuelve problemas en pequeños pasos

# NOTE: doing a really good translation would require the word order
# to be changed in some places. You're not expected to do that! :)

DICTIONARY ||= {
  'a' => 'un',
  'good' => 'buen',
  'developer' => 'desarrollador',
  'solves' => 'resuelve',
  'problems' => 'problemas',
  'in' => 'en',
  'small' => 'pequeños',
  'steps' => 'pasos',
  'great' => 'excelente',
  'executes' => 'ejecuta',
  'code' => 'su código',
  'frequently' => 'con frecuencia',
  'is' => 'es',
  'team' => 'equipo',
  'player' => 'jugador',
  'listener' => 'oyente'
}

sentence = gets.chomp

puts sentence.split(' ').map { |w| DICTIONARY[w] }.join(' ')