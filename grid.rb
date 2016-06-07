gets.chomp.to_i - 1.times do
	product = 1
	largest = 1
	dim = gets.chomp.split.map(&:to_i)
	arr = []
	(0..dim[0] - 1).each do
		arr << gets.chomp.split.map(&:to_i)
	end
	
	#horizontal
	(0..dim[1] - 1).each do |row|
		(0..dim[0] - 4).each do |col|
			product *= arr[row][col , 3].reduce(:*)
			largest = product if product > largest
			product = 1
		end
	end
	
	#vertically
	(0..dim[0] - 4).each do |row|
		(0..dim[1] - 1).each do |col|
			(0..3).each do
				product *= arr[row + i][col]
			end
			largest = product if product > largest
			product = 1
		end
	end
	
	#diagonal-left
	(0..dim[0] - 4).each do |row|
		(3..dim[1] - 1).each do |col|
			(0..3).each do |i|
				product *= arr[row + i][col - i].to_i
			end
			largest = product if product > largest
			product = 1
		end
	end
	
	#diagonal-right
	(0..dim[1] - 4).each do |row|
		(0..dim[0] - 4).each do |col|
			(0..3).each do |i|
				product *= arr[row + i][col + i].to_i
			end
			largest = product if product > largest
			product = 1
		end
	end
	puts largest
end
#final code