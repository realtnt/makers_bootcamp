require 'dotenv/load'
require 'twilio-ruby'

class TwilioService
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from_mobile = ENV['FROM_MOBILE']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_text(message, mobile)
    fail 'Invalid or empty message' unless message.is_a?(String) && !message.empty?
    fail 'Invalid mobile number' unless mobile =~ /^(\+\d{1,3}?)?\d{10}$/
    message = @client.messages
      .create(
        body: message,
        from: @from_mobile,
        to: mobile
      )
    return message.status
  end
end