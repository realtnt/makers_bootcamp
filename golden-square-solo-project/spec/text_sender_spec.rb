require 'dotenv/load'
require 'text_sender'

RSpec.describe TextSender do
  context 'When sending an SMS is successful ' do
    xit 'should return true' do
      text_sender = TextSender.new('test text sender', ENV['TEST_MOBILE'])
      expect(text_sender.send).to eq true
    end
  end
  context 'When sending an SMS is not successful because of invalid message' do
    it 'should return raise an error' do
      text_sender = TextSender.new('', ENV['TEST_MOBILE'])
      expect{text_sender.send}.to raise_error 'Invalid or empty message'
    end
    it 'should return raise an error' do
      text_sender = TextSender.new(true, ENV['TEST_MOBILE'])
      expect{text_sender.send}.to raise_error 'Invalid or empty message'
    end
  end
  context 'When sending an SMS is not successful because of invalid mobile number' do
    it 'should return raise an error' do
      text_sender = TextSender.new('test text', '')
      expect{text_sender.send}.to raise_error 'Invalid mobile number'
    end
    it 'should return raise an error' do
      text_sender = TextSender.new('test text', '3255454')
      expect{text_sender.send}.to raise_error 'Invalid mobile number'
    end
    it 'should return raise an error' do
      text_sender = TextSender.new('test text', true)
      expect{text_sender.send}.to raise_error 'Invalid mobile number'
    end
  end
end