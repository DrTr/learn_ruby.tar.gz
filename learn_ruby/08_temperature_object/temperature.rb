require "./temperature_01"  
class Temperature

	def initialize (options= [])
    @data = options 
  end
  
  def in_fahrenheit
    t = @data.has_key?(:f) ? @data[:f] : ctof(@data[:c]) 
  end

  def in_celsius
    t = @data.has_key?(:c) ? @data[:c] : ftoc(@data[:f])   
  end
  
  def self.from_celsius(degree)
    class_eval "Temperature.new(:c => #{degree})"
  end
  
  def self.from_fahrenheit(degree)
    class_eval "Temperature.new(:f => #{degree})"
  end 
end

class Celsius < Temperature
  def initialize(degree)
    @data = degree
  end
  
  def in_fahrenheit
    ctof(@data) 
  end
  
  def in_celsius
    @data
  end
end
  
class Fahrenheit < Temperature
    def initialize(degree)
    @data = degree
  end
  
  def in_celsius
    ftoc(@data) 
  end
  
  def in_fahrenheit
    @data
  end
end
