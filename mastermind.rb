# variable initialization
# note that i'm splitting the code into an array rather than just removing the
# spaces. each peg is an individual item and there's no specific reason to keep
# it as a string. plus you can zip arrays which comes in handy later on.
code = gets.chomp.split
guesses = 0
done = false
# main loop
until done
  guesses += 1
  # combines input and code into one array, much easier to compare placement
  turn = gets.chomp.split.zip code
  correct_place = 0
  correct_color = 0
  # this one line checks all 4 placements
  # for each element in the zipped array it deletes the elements and adds 1 to
  # the placement counter if the pegs in the code and input are equal
  turn.delete_if { |e| correct_place += 1 if e[0] == e[1] }
  # tranpose has a nice side-effect of unzipping an array
  guess, copy = turn.transpose
  # prevent from NoMethodError on nil when all elements are placed correctly
  if guess
    # check each unplaced value in guess if it is in the remainder of the code
    guess.each do |e|
      # apparently using ruby's version of continue is considered good practice?
      next unless copy.include? e
      # if it is, increment counter then remove the peg from the code
      correct_color += 1
      copy.slice! copy.index(e)
    end
  else
    # if there are no unplaced elements, we are done
    done = true
  end
  puts "#{correct_place} #{correct_color}"
end
puts "#{guesses} guesses"
