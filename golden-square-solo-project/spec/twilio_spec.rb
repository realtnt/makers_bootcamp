require 'dotenv/load'
require 'twilio'

RSpec.describe Twilio do
  twilio = TwilioService.new
  context 'When sending a valid SMS to a valid mobile number' do
    xit 'should return a status of queued' do
      expect(twilio.send_text('test text', ENV['TEST_MOBILE'])).to eq 'queued'
    end
  end
  context 'When sending an invalid or empty SMS to a valid mobile number' do
    it 'should fail: Invalid or empty message' do
      expect{twilio.send_text('', ENV['TEST_MOBILE'])}.to raise_error 'Invalid or empty message'
    end
    it 'should fail: Invalid or empty message' do
      expect{twilio.send_text(true, ENV['TEST_MOBILE'])}.to raise_error 'Invalid or empty message'
    end
    it 'should fail: Invalid or empty message' do
      expect{twilio.send_text(54, ENV['TEST_MOBILE'])}.to raise_error 'Invalid or empty message'
    end
    it 'should fail: Invalid or empty message' do
      expect{twilio.send_text(5.4, ENV['TEST_MOBILE'])}.to raise_error 'Invalid or empty message'
    end
    it 'should fail: Invalid or empty message' do
      expect{twilio.send_text(nil, ENV['TEST_MOBILE'])}.to raise_error 'Invalid or empty message'
    end
  end
  context 'When sending a valid SMS to an invalid mobile number' do
    it 'should fail: Invalid mobile number' do
      expect{twilio.send_text('test text', '')}.to raise_error 'Invalid mobile number'
    end
    it 'should fail: Invalid mobile number' do
      expect{twilio.send_text('test text', '001234')}.to raise_error 'Invalid mobile number'
    end
    it 'should fail: Invalid mobile number' do
      expect{twilio.send_text('test text', '07777777777')}.to raise_error 'Invalid mobile number'
    end
  end
end