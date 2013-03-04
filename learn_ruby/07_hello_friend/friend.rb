class Friend

  def greeting(who = nil)
    "Hello" << (who != nil ? ", #{who}!" : "!")
  end 

end