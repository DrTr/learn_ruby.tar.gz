TEMP_MULT = 5.0 / 9.0
TEMP_DIFF = 32

def ctof(t)
  t / TEMP_MULT + TEMP_DIFF
end

def ftoc(t)
  (t - TEMP_DIFF) * TEMP_MULT
end
