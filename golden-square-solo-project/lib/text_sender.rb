class TextSender
  def initialize(message, mobile, service = 'Twilio') 
    @message = message
    @mobile = mobile
    if service == 'Twilio'
      @service = TwilioService.new
    end
  end

  def send
    @service.send_text(@message, @mobile) == 'queued' ? true : false
  end
end