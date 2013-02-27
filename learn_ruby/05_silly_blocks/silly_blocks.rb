
def reverser
  p = Proc.new do
    words ||= ""
    lambda = ->(word){ words << word.reverse! << " " }
    yield.split.each{ |word| lambda.(word) }
    return words.strip
  end
  p.call
end

def adder(count = 1)
  yield + count 
end

def repeater(count = 1)
  count.times{ yield }
end