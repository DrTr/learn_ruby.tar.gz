class Dictionary 
  attr_reader :entries 

  def initialize
    @entries = {}
  end
  
  def add(arg = {})
    if arg.is_a? Hash 
      @entries.merge!(arg)
    else
      @entries[arg] = nil
    end
  end
  
  def keywords;       @entries.keys.sort;    end
  
  def include?(key); @entries.include? key; end
  
  def find(prefix);  @entries.select{ |key, value| key =~ /^#{prefix}/ }  end
  
  def printable
    to_print = ""
    @entries.keys.sort.each { |key| to_print << "[#{key}] \"#{@entries[key]}\"\n" }   
    to_print.strip
  end
end