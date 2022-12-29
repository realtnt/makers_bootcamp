require 'require_all'
require_all 'lib'

RSpec.describe 'Battleship integration ' do
  context 'When starting the game' do
    it 'should return [Ship.new("Carrier", 5), Ship.new("Battleship", 4), Ship.new("Cruiser", 3), Ship.new("Submarine", 3), Ship.new("Destroyer", 2)]' do
      game = Game.new
      expect(game.unplaced_ships).to eq [
        Ship.new(ship_class: "Carrier", length: 5), 
        Ship.new(ship_class: "Battleship", length: 4), 
        Ship.new(ship_class: "Cruiser", length: 3), 
        Ship.new(ship_class: "Submarine", length: 3), 
        Ship.new(ship_class: "Destroyer", length: 2)
      ]
    end
  end
end