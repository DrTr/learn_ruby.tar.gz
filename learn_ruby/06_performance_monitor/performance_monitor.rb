require 'time'

def measure(num_trials = 1)
  t = 0.0
  num_trials.times do
    t1 = Time.now
    yield
    t2 = Time.now  
    t += t2 - t1
  end
  return t / num_trials 
end
