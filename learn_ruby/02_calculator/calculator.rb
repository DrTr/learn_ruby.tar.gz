def add(num_a, num_b)
  num_a + num_b
end

def subtract(num_a, num_b)
  num_a - num_b
end

def sum(array)
  return array.inject(:+) || 0
end

def multiply(*numbers)
	numbers.inject(:*) || 0
end

def power(num, power)
  num ** power
end

def factorial(n)
	raise ArgumentError if n < 0 
  (1..n).inject(:*) || 1
end
