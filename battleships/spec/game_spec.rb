require 'game'

RSpec.describe Game do
  context 'When starting the game' do
    it 'should return [fake_carrier, fake_battleship, fake_cruiser, fake_submarine, fake_destroyer]' do
      ship_dbl = double :Ship, length: 5
      fake_carrier = double :Ship, ship_class: 'Carrier', length: 5
      fake_battleship = double :Ship, ship_class: 'Battleship', length: 4
      fake_cruiser = double :Ship, ship_class: 'Cruiser', length: 3
      fake_submarine = double :Ship, ship_class: 'Submarine', length: 3
      fake_destroyer = double :Ship, ship_class: 'Destroyer', length: 2      
      allow(ship_dbl).to receive(:new).with(ship_class: 'Carrier', length: 5).and_return(fake_carrier)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Battleship', length: 4).and_return(fake_battleship)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Cruiser', length: 3).and_return(fake_cruiser)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Submarine', length: 3).and_return(fake_submarine)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Destroyer', length: 2).and_return(fake_destroyer)
      game = Game.new(ship_dbl)
      expect(game.unplaced_ships).to eq [fake_carrier, fake_battleship, fake_cruiser, fake_submarine, fake_destroyer]
    end
  end
  context 'When placing a ship' do
    it ': should remove a ship of that length from @unplaced_ships' do
      ship_dbl = double :Ship
      fake_carrier = double :Ship, ship_class: 'Carrier', length: 5
      fake_battleship = double :Ship, ship_class: 'Battleship', length: 4
      fake_cruiser = double :Ship, ship_class: 'Cruiser', length: 3
      fake_submarine = double :Ship, ship_class: 'Submarine', length: 3
      fake_destroyer = double :Ship, ship_class: 'Destroyer', length: 2      
      allow(ship_dbl).to receive(:new).with(ship_class: 'Carrier', length: 5).and_return(fake_carrier)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Battleship', length: 4).and_return(fake_battleship)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Cruiser', length: 3).and_return(fake_cruiser)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Submarine', length: 3).and_return(fake_submarine)
      allow(ship_dbl).to receive(:new).with(ship_class: 'Destroyer', length: 2).and_return(fake_destroyer)
      allow(fake_carrier).to receive_message_chain(:coords, :<<)
      game = Game.new(ship_dbl)
      game.place_ship(length: 5, orientation: 'v', row: 1, col: 1)
      expect(game.unplaced_ships).to eq [fake_battleship, fake_cruiser, fake_submarine, fake_destroyer]
    end
    it "should add the ship's coordinates in an array" do
      game = Game.new
      game.place_ship(length: 5, orientation: 'v', row: 1, col: 1)
      expect(game.ship_at?(1, 1)).to eq true
      expect(game.ship_at?(2, 1)).to eq true
      expect(game.ship_at?(3, 1)).to eq true
      expect(game.ship_at?(4, 1)).to eq true
      expect(game.ship_at?(5, 1)).to eq true
    end      
  end
  context 'The default board size is 10x10' do
    it 'should return 10 for rows and columns' do
      game = Game.new
      expect(game.rows).to eq 10
      expect(game.cols).to eq 10
    end
  end

end
