LITTLE_WORDS = ['the','a','to','and','or','on','not','of','in','over']

def echo(word)
  word  
end

def shout(word)
  word.upcase!
end

def repeat(word, times = 2)
  word.strip
  ( (word + " ") * times ).strip
end

def start_of_word(word, count)
  word[0...count]
end

def first_word(text)
  words = text.split
  words[0]
end

def titleize(text)
  words = text.split
  words[0].capitalize!
  title = words[0] + " "
  for word in 1...words.length do
    unless LITTLE_WORDS.include? words[word]
      words[word].capitalize!
    end
    title << words[word] << " "
  end
  title.strip
end
