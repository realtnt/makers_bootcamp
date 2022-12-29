class Ship
  attr_reader :ship_class
  attr_reader :length
  attr_accessor :player
  attr_accessor :coords
  attr_accessor :hits
  attr_accessor :destroyed

  def initialize(ship_class:, length:)
    @ship_class = ship_class
    @length = length
    @player = 1
    @coords = []
    @hits = 0
    @destroyed = false
  end

  def ==(ship)
    @ship_class == ship.ship_class && @player == ship.player
  end
end

