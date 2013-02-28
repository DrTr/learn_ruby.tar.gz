require "time"

class Timer
  def initialize
    @time = 0  
  end
  
  def seconds=(interval)
    @time = interval
  end
      
  def seconds
    @time
  end
      
  def time_string
    hours = @time / 3600
    minutes = @time % 3600 / 60
    seconds = @time % 60
    "%02d:%02d:%02d" % [hours, minutes, seconds]
  end
  
  def padded(number)
    number / 10 == 0 ? "0" << number.to_s : number.to_s    
  end
end
