LITTLE_WORDS = ['the','a','an','to','and','or','on','not','of','in','over']

def echo(word)
  word  
end

def shout(word)
  word.upcase!
end

def repeat(word, times = 2)
  ( (word + " ") * times ).strip
end

def start_of_word(word, count)
  word[0...count]
end

def first_word(text)
  text.split[0]
end

def titleize(text)
  words = text.split
  words[0].capitalize!
  for word in 1...words.size do
    unless LITTLE_WORDS.include? words[word]
      words[word].capitalize!
    end
  end
  words.join(" ")
end
