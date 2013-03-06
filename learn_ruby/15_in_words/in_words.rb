class Integer
  def in_words
    return "zero" if self == 0 
    power = ["", "thousand ", "million ", "billion ", "trillion "]
    tens = %w(- - twenty thirty forty fifty sixty seventy eighty ninety)   
    teens = %w(ten eleven twelve thirteen fourteen fifteen
                sixteen seventeen eighteen nineteen) 
    digits = %w(zero one two three four five six seven eight nine)
    words = ''
    number = self
    text = []
    i = 0
    while number > 0
      words << "#{digits[number % 1000 / 100]} hundred " unless number % 1000 / 100 == 0
      if (10..19).include? (number % 100)
        words << "#{teens[number % 10]} "
      else
        words << "#{tens[number % 100 / 10 ]} " unless number % 100 / 10 == 0
        words << "#{digits[number % 10]} " unless number % 10 == 0
      end     
      words << power[i] unless number % 1000 == 0
      text.push(words.clone)
      number /= 1000
      words.clear
      i += 1
    end
    text.reverse!.join.strip
  end
end