class Friend

  def greeting(who = nil)
    message = "Hello"
    message <<', '<< who unless who == nil
    message << '!'
  end 

end