class Book
  @@LITTLE_WORDS = %w(the a  an to and or on not of in over)
  attr_reader :title
  
  def title=(text)
    @title = text.split.each do |word|
      word.capitalize! unless @@LITTLE_WORDS.include? word
    end.join(" ")
    @title[0] = @title[0].upcase
  end
end
