class Dictionary 
  def initialize
    @data = {}
  end
  
  def entries
    @data
  end
  
  def add(arg = {})
    if arg.is_a? Hash 
      @data.merge!(arg)
    else
      @data[arg] = nil
    end
  end
  
  def keywords
    @data.keys.sort
  end
  
  def include?(key)
    @data.include? key 
  end
  
  def find(prefix)
    @data.select{ |key, value| key =~ /^#{prefix}/ }
  end
  
  def printable
    to_print ||= ""
    @data.keys.sort.each { |key| to_print << "[#{key}] \"#{@data[key]}\"\n" }   
    to_print.strip
  end
end