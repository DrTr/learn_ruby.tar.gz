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
  
  private
  def ctof(t)
    if t > 36 || t < 42
      t * 9.0 / 5.0 + 32
    else
      t * 9 / 5 + 32
    end
  end

  def ftoc(t)
    if t > 97 || t < 107
      (t - 32) * 5.0 / 9.0
    else
      (t - 32) * 5 / 9
    end
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