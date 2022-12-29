# This exercise brings together several things that
# you've covered previously
# - classes and methods
# - iteration
# - accessing values in a hash
# - summing the values in an array

# Your task is to...

# Write a program that calculates the score for a word in Scrabble.
# It should include:
#
#   * a class called `ScrabbleSolver` which implements a method called `score`
#
#   * A hash which maps each letter to the relevant score
#     * 0 points: blank tile
#     * 1 point: E, A, I, O, N, R, T, L, S, U
#     * 2 points: D, G
#     * 3 points: B, C, M, P
#     * 4 points: F, H, V, W, Y
#     * 5 points: K
#     * 8 points: J, X
#     * 10 points: Q, Z

# * Note: You can assume that the user will enter a word that only
#   contains letters and blanks.  You can assume the word will be in
#   uppercase.

class ScrabbleSolver
  def initialize
    @tile_values = {
      '0' => ' ',
      '1' => 'EAIONRTLSU',
      '2' => 'DG',
      '3' => 'BCMP',
      '4' => 'FHVWY',
      '5' => 'K',
      '8' => 'JX',
      '10' => 'QZ'
    }
  end

  def score(string)
    word_value = 0
    @tile_values.each do |key, value|
      string.chars.each { |c| word_value += key.to_i if value.include?(c) }
    end
    word_value
  end
end

solver = ScrabbleSolver.new

puts solver.score(('A'..'Z').to_a.join(''))
puts solver.score(' A  ')
