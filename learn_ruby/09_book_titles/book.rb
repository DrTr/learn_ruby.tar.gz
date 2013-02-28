class Book
  @@LITTLE_WORDS = ['the','a','an','to','and','or','on','not','of','in','over']
  
  def title=(text)
    words = text.split
    words[0].capitalize!
    @title = words[0] + " "
    for word in 1...words.size do
      words[word].capitalize! unless @@LITTLE_WORDS.include? words[word]
      title << words[word] << " "
    end
    @title.strip!
  end

  def title
    @title
  end
end
