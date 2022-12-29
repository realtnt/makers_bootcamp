require 'delivery_time'

RSpec.describe DeliveryTime do
  context 'When asking for the delivery time at different times of the day' do
    # => 30 between 5pm-7pm, 45 7pm-9pm, 35 9pm-11pm
    it 'should return 30' do
      time_dbl = double :time
      delivery_time = DeliveryTime.new(time_dbl)
      expect(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,17,17,00))
      expect(delivery_time.get_delivery_time).to eq 30
    end
    it 'should return 45' do
      time_dbl = double :time
      delivery_time = DeliveryTime.new(time_dbl)
      expect(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,19,17,00))
      expect(delivery_time.get_delivery_time).to eq 45
    end
    it 'should return 35' do
      time_dbl = double :time
      delivery_time = DeliveryTime.new(time_dbl)
      expect(time_dbl).to receive(:now).and_return(Time.new(2022,05,10,21,17,00))
      expect(delivery_time.get_delivery_time).to eq 35
    end
  end
end
