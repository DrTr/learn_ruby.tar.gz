class Friend
  def greeting(who = nil)
    "Hello" << (who ? ", #{who}!" : "!")
  end 
end