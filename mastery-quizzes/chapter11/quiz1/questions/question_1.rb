# EXTENSION: Well done for getting this far!
# In this extension chapter, you'll get more practice with
# - classes
# - methods
# - control flow
# - hashes
# - arrays

# To complete this challenge, let the tests guide you and focus on one method at a time.
#
# Write a program that lets a user player a solo game of
# Blackjack. The program should:
#
# * Ask the player if they want to "hit" or "stick".
#   * If the player hits, add a card to their hand.
#   * If the player sticks, end the game.
#
# * Keep asking the player if they want to "hit" or "stick" until they
#   say "stick".
#
# * Each time the player hits, calculate the score for the player's
#   hand and `puts` `Score so far: ` and the score.
#   * e.g. `Score so far: 23`
#
#   * A score is calculated by adding up the values of each of the
#     cards in the player's hand.
#
#   * Value for each card:
#     * "two": 2
#     * "three": 3
#     * "four": 4
#     * "five": 5
#     * "six": 6
#     * "seven": 7
#     * "eight": 8
#     * "nine": 9
#     * "ten": 10
#     * "jack": 10
#     * "queen": 10
#     * "king": 10
#     * "ace": 11 (This is slightly different from real Blackjack.)
#
# * When the game is over, `puts` the outcome of the game.
#
#   * If the player's score is `<= 21`, `puts` `You scored: ` and the
#     final score
#     * e.g. `You scored: 20`
#
#   * If the player's score is `> 21`, `puts` `You busted with: ` and
#     the final score.
#     * e.g. `You busted with: 25`

# * As part of your solution, there will be two classes:
#
# The Blackjack class, which has these methods:
#
#   * `initialize`: creates a new instance of the Deck class
#
#   * `move`: Asks the player for a move.  If they enter `hit` or
#     `stick`, it returns the move.  If they enter something else, it
#     keeps asking them until they enter `hit` or `stick`.
#
#   * `score`: Takes an array of cards and returns the score for the
#     hand as an integer.
#
#   * `run_game`: uses the other methods to run a game of Blackjack.
#
#   * NOTE: When you run the automated tests, make sure to remove from
#     the top level of the file any calls to `run_test` or other
#     methods.
#
#   * NOTE: To stop the game when the user sticks, don't use `exit` to
#     quit the program because this will break the automated tests.  To
#     exit a while loop early, use the `break` keyword.
#
# The Deck class, with these methods (which are already implemented):
#   * `draw_card`: removes a random card from the deck and returns it.
#   * `cards`: returns all the remaining cards
#   * `initialize`: assigns values to the @cards array

CARD_VALUES = {
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  'ten' => 10,
  'jack' => 10,
  'queen' => 10,
  'king' => 10,
  'ace' => 11
}

class Blackjack
  # Don't change this (but make sure you understand it)
  def initialize
    @deck = Deck.new
    @hand = []
  end

  def move
    while true
      print 'Hit or Stick? '
      user_move = gets.chomp
      break if %w[hit stick].include? user_move
    end
    user_move
  end

  def score(hand)
    hand.map { |card| CARD_VALUES[card] }.sum
  end

  def run_game
    hand = []

    while move.downcase != 'stick'
      hand << @deck.draw_card
      puts "Score so far: #{score(hand)}"
    end

    if score(hand) > 21
      puts "You busted with: #{score(hand)}"
    else
      puts "You scored: #{score(hand)}"
    end
  end
end

class Deck
  attr_reader :cards

  # Don't change this (but make sure you understand it)
  def initialize
    @cards = %w[
      two three four five six
      seven eight nine ten
      jack queen king ace
    ] * 4
  end

  # Don't change this (but make sure you understand it)
  def draw_card
    index = rand(cards.length)
    @cards.delete_at(index)
  end
end

# game = Blackjack.new

# game.run_game
