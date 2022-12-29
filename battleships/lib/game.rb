require 'ship'

class Game
  attr_reader :rows
  attr_reader :cols
  def initialize(ship = Ship, rows = 10, cols = 10)
    @ship = ship
    @rows = rows
    @cols = cols
    @unplaced_ships = [
      @ship.new(ship_class: 'Carrier', length: 5), 
      @ship.new(ship_class: 'Battleship', length: 4),
      @ship.new(ship_class: 'Cruiser', length: 3), 
      @ship.new(ship_class: 'Submarine', length: 3), 
      @ship.new(ship_class: 'Destroyer', length: 2)
    ]
    @placed_ships = []
  end

  def unplaced_ships
    @unplaced_ships
  end

  def place_ship(length:, orientation:, row:, col:)
    @unplaced_ships.each do |ship|
      if ship.length == length
        length.times do |i|
          if orientation == :vertical
            ship.coords << [col, row + i]
          else
            ship.coords << [col + i, row]
          end
        end
        @placed_ships << ship
        @unplaced_ships.delete(ship)
        break
      end
    end
  end

  def ship_at?(x, y)
    @placed_ships.each do |ship|
      if ship.coords.include?([x, y])
        return true
      end
    end
    return false
  end
end
