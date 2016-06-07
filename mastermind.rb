# initialize
code = gets.split
input = Array.new
arr = Array.new

# gather input per line until the code is typed
begin
	input = gets.chomp.split
	arr.push(input)
end until input == code

# In the following array, 1 will mean checked by same column, which overrides 0, which means checked by different column NOTE: checked means same letter present
claim = Array.new(arr.length){Array.new(4)}
# x - which guess being checked : c - letters in code : g - letters in guess
for x in 0..arr.length - 1
	# p is number of aligned letters, i is similar letters
	p = 0
	i = 0
	for c in 0..3
		for g in 0..3
			# check if same letter, then check if aligned (same index)
			if input.at(c) == arr.at(x).at(g)
				if g == c
					p += 1
					# decrement i if aligned letter found
					if claim[x][g] == 0
						i -= 1
					end
					# marked checked by aligned letter
					claim[x][g] = 1
					next
				# If letter is unchecked, then the array element is nil, set it to 0 meaning checked by unaligned letter
				elsif claim.at(x).at(g) == nil
					claim[x][g] = 0
					i += 1
				end
			end
		end
	end
	puts "#{p} #{i}"
end
puts "#{arr.length} guesses"
