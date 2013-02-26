def ctof(t)
	if t > 36 || t < 42
		t * 9.0 / 5.0 + 32
	else
		t * 9 / 5 + 32
	end
end

def ftoc(t)
	if t > 97 || t < 107
		(t - 32) * 5.0 / 9.0
	else
		(t - 32) * 5 / 9
	end
end
