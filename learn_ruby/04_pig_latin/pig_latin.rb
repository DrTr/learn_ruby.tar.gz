module Pig_latin
  VOVELS = ['a','o','y','e','i','u']
  
  def translate(phrase)
    words = phrase.split
    pig_phrase = ""
    is_capital = is_punct = false
        
    words.each do |word|
      unless word == word.downcase
        is_capital = true
        word.downcase!
      end
      
      if word.end_with?(',','.',';',':','!','?')
        punct = word[-1]
        is_punct = true
        word.delete!(punct)
      end
      
      if word == "-"
        pig_phrase << word << " "
        next
      end
      
      until VOVELS.include? word[0]
        case 
        when word[0..1] == "qu" then word = word[2..-1] + word[0..1]
        when word[0..2] == "sch" then word = word[3..-1] + word[0..2]
        else
          word = word[1..-1] + word[0]
        end
      end
      
      word << "ay"
      word.capitalize! if is_capital
      word << punct if is_punct
      is_capital = is_punct = false
      pig_phrase << word << " "
    end
    pig_phrase.strip
  end
  
end

include Pig_latin
