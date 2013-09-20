class XmlDocument
  def initialize(is_indents = false, increment = 2)
    @is_indents = is_indents
    @indent_counter = 0
    @increment = increment
  end
  
  def send(name, args = {}, &block)
    tag = "<#{name}"
    unless args.size == 0
      args.each{ |key, value| tag << " #{key.to_s}=\'#{value}\'" }
    end
    tag << if block
      ">" + indent(true) + "#{yield}</#{name}>" + indent(false)
    else
      "/>" + indent(false)
   end
  end
  
  %w(hello goodbye come_back ok_fine).each do |method|
    define_method(method) { |arg = {}, &block| send(method, arg, &block) }
  end
  
  private
  def indent(increase)
     if @is_indents
       @indent_counter += if increase 
         @increment
       else
         @indent_counter == 0 ?  0 : -@increment
       end
       "\n" + (" " * @indent_counter)
     else
       ""
     end
  end
end