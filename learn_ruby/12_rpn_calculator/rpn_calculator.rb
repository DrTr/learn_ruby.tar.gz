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
    do_operator(:+)
  end
 
  def minus
    do_operator(:-)
  end 
  
  def divide
    do_operator(:/)
  end
  
  def times
    do_operator(:*)
  end
  
  def tokens(str)
    str.split.map{ |x| x =~ /\A\d*\z/ ? x.to_i : x.to_sym }   
  end
  
  def evaluate(str)
    rpn_eval = RPNCalculator.new
    tokens(str).each do |x|
      (x.is_a? Integer) ? rpn_eval.push(x) : rpn_eval.do_operator(x)
    end
    rpn_eval.value
  end
  
  def do_operator(operator_type)
    raise Exception, "calculator is empty" if @stack.size < 2
    @value = [@stack.pop ,@stack.pop].map(&:to_f).reduce(operator_type)
    @stack.push(value)
  end
end
