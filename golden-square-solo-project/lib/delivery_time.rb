require 'date'

DELIVERY_TIME_5PM_7PM = 30
DELIVERY_TIME_7PM_9PM = 45
DELIVERY_TIME_9PM_11PM = 35

class DeliveryTime
  def initialize(time = Time)
    @time = time
  end

  def get_delivery_time 
    # current hour
    hour = @time.now.hour
    if hour >= 21
      return DELIVERY_TIME_9PM_11PM
    elsif hour >= 19
      return DELIVERY_TIME_7PM_9PM
    else
      return DELIVERY_TIME_5PM_7PM
    end
  end
end