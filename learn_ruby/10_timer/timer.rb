require "time"

class Timer
  
  attr_accessor :seconds
  
  def initialize
    @seconds = 0  
  end
  
  def seconds=(interval)
    @seconds = interval
  end
      
  def time_string
    hours = @seconds / 3600
    minutes = @seconds % 3600 / 60
    seconds = @seconds % 60
    "%02d:%02d:%02d" % [hours, minutes, seconds]
  end
  
  def padded(number)
    number / 10 == 0 ? "0" << number.to_s : number.to_s    
  end
end
