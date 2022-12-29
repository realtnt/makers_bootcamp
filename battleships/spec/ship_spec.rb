require 'ship'

RSpec.describe Ship do
  context 'Creating a ship' do
    it "should return ship_class and length" do
      ship = Ship.new(ship_class: 'Cruiser', length: 3)
      expect(ship.ship_class).to eq 'Cruiser'
      expect(ship.length).to eq 3
    end
  end
  context 'Testing that two ships are the same' do
    it "should return ship_class and length" do
      ship = Ship.new(ship_class: 'Cruiser', length: 3)
      expect(ship.ship_class).to eq 'Cruiser'
      expect(ship.length).to eq 3
    end
  end
end