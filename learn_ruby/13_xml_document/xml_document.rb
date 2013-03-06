class XmlDocument
  def initialize(is_indents = false)
    @is_indents = is_indents
    @indent_counter = 0
  end
  
  def send(name, arg = {}, &block)
    tag = "<#{name}"
    tag << " #{arg.keys[0].to_s}=\'#{arg.values[0]}\'" unless arg.size == 0 
    if block 
       tag << ">" << indent_controller(true) << "#{yield}</#{name}>" << indent_controller(false)
    else
       tag << "/>" << indent_controller(false)
   end
  end
  
  %w(hello goodbye come_back ok_fine).each do |method|
    define_method(method) { |arg = {}, &block|  send(method, arg, &block) }
  end
  
  private
  def indent_controller(increase)
     if @is_indents
       increase ? @indent_counter += 2 : (@indent_counter -= 2 if @indent_counter > 0)    
       "\n" + (" " * @indent_counter) 
     else
       ""
     end
  end  
end