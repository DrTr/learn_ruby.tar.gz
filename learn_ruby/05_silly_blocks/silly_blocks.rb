def reverser
  yield.split.each{ |x| x.reverse!}.join(' ')
end

def adder(count = 1)
  yield + count 
end

def repeater(count = 1)
  count.times{ yield }
end