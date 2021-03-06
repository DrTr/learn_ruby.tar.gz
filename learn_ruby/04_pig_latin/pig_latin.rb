VOVELS = %w(a o y e i u)
IGNORE = %w(-)
ONE_TONE = %w(qu sch)
PUNCTUATION = %w(, . ; : ! ?)
  
def translate(phrase)   
  phrase.split.each do |word|
    is_capital = is_punct = false
    next if IGNORE.include? word 
    
    unless word == word.downcase
      is_capital = true 
      word.downcase!
    end
    
    if word.end_with?(*PUNCTUATION)
      punct = word[-1]
      is_punct = true
      word.delete!(punct)
    end
    
    i = 0
    while i < word.length
      if tone = ONE_TONE.detect{ |t| word.start_with? t }
        word << word.slice!(/^#{tone}/)
        i += tone.length										  
      elsif VOVELS.include? word[0]
        break
      else
        word << word.slice!(0)
        i += 1
      end
    end
    
    word << "ay"
    word.capitalize! if is_capital
    word << punct if is_punct
  end.join(" ")
end

