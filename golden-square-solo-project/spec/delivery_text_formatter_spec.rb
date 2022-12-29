require 'delivery_text_formatter'

RSpec.describe DeliveryTextFormatter do
  context 'When sending an SMS' do
    it 'should return the message as a string' do
      order = double :Order
      allow(order).to receive(:get_order_time).and_return(Time.new(2022,05,10,17,17,00))
      delivery_time = double :DeliveryTime
      allow(delivery_time).to receive(:get_delivery_time).and_return(30)
      sms_text = DeliveryTextFormatter.new(order, delivery_time)
      expect(sms_text.format).to eq 'Thank you! Your order was placed and will be delivered before 17:47'
    end
  end
end