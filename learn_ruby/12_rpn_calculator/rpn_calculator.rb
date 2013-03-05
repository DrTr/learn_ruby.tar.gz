class RPNCalculator
  attr_reader :value
    
  def initialize
    @value = 0
    @stack = []
  end
  
  def push(x)
    @stack.push(x)    
  end
  
  def plus
    do_operator(:to_i, :+)
  end
 
  def minus
    do_operator(:to_i, :-)
  end 
  
  def divide
    do_operator(:to_f, :/)
  end
  
  def times
    do_operator(:to_f, :*)
  end
  
  def tokens(str)
    str.split.map{ |x| x =~ /\A\d*\z/ ? x.to_i : x.to_sym }   
  end
  
  def evaluate(str)
    tmp_stack = str.split
    i = 2
    while i < tmp_stack.size
      unless tmp_stack[i] =~ /\A\d*\z/
        tmp_stack[i] = eval("1.0 *"+tmp_stack[i-1]+tmp_stack[i]+tmp_stack[i-2]).to_s
        tmp_stack.delete_at(i - 1)
        tmp_stack.delete_at(i - 2)
        i -= 2
      end
      i += 1
    end
    tmp_stack.last.to_f
  end
  
  private
  def do_operator(data_type,operator_type)
    raise Exception, "calculator is empty" if @stack.size < 2
    @value = [@stack.pop ,@stack.pop].map(&data_type).reduce(operator_type)
    @stack.push(value)
  end
end