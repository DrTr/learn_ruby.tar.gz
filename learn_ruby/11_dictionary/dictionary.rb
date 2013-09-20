class Dictionary 
  attr_reader :entries 

  def initialize
    @entries = {}
    @modified = false
    @keys = []
  end
  
  def add(arg = {})
    if arg.is_a? Hash 
      @entries.merge!(arg)
    else
      @entries[arg] = nil
    end
	  @modified = true
  end
  
  def sort_keys
    @modified = false
    @keys = @entries.keys.sort		
  end

  def keywords
    sort_keys if @modified
    @keys
  end
  
  def include?(key)
    @entries.include? key
  end
  
  def find(prefix)
    @entries.select{ |key, value| key =~ /^#{prefix}/ }  
  end
  
  def printable
    to_print = ""
    sort_keys if @modified
    @keys.each { |key| to_print << "[#{key}] \"#{@entries[key]}\"\n" }   
    to_print.strip
  end
end
