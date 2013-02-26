def add(num_a, num_b)
	num_a + num_b
end

def subtract(num_a, num_b)
	num_a - num_b
end

def sum(array)
	sum = 0
	array.each{|num| sum += num}
	sum
end

def multiply(num_a,num_b)
  mult_a, mult_b = 1, 1
  if num_a.is_a? Array
    num_a.each{|num| mult_a *= num}
  else
    mult_a = num_a
  end
  if num_b.is_a? Array
    num_b.each{|num| mult_b *= num}
  else
    mult_b = num_b
  end
  mult_a * mult_b
end

def power(num, power)
  num ** power
end

def factorial(n)
  fact = 1
  for num in 1..n do
    fact *= num
  end
  fact
end
