num_guesses = 0
print "Put the code here: "
the_code = gets.chomp
#getting the code
pin_one = the_code[0]
pin_two = the_code[2]
pin_three = the_code[4]
pin_four = the_code[6]
#separating the code into four pins
correct_guess = false
while correct_guess == false
    white = 0
    print "Put your guess here: "
    guess = gets.chomp
    guess_pin_one = guess[0]
    guess_pin_two = guess[2]
    guess_pin_three = guess[4]
    guess_pin_four = guess[6]
    #getting the guess
    red = 0
    #number of correct pins in correct places
    boo_guess_pin_one = false
    boo_guess_pin_two = false
    boo_guess_pin_three = false
    boo_guess_pin_four = false
    boo_pin_one = false
    boo_pin_two = false
    boo_pin_three = false
    boo_pin_four = false
    if guess_pin_one == pin_one
        red += 1
        boo_guess_pin_one = true
        boo_pin_one = true
    end
    if guess_pin_two == pin_two
        red += 1
        boo_guess_pin_two = true
        boo_pin_two = true
    end
    if guess_pin_three == pin_three
        red += 1
        boo_guess_pin_three = true
        boo_pin_three = true
    end
    if guess_pin_four == pin_four
        red += 1
        boo_guess_pin_four = true
        boo_pin_four = true
    end
    white = 0
    #number of pins that are the correct color but wrong spot
    if boo_pin_one == false
        if boo_guess_pin_two == false && pin_one == guess_pin_two
                white += 1
                boo_guess_pin_two = true
                boo_pin_one = true
        elsif boo_guess_pin_three == false && pin_one == guess_pin_three
                white += 1
                boo_pin_one = true
                boo_guess_pin_three = true
        elsif boo_guess_pin_four == false && pin_one == guess_pin_four
                white += 1
                boo_pin_one = true
                boo_guess_pin_four = true
        end
    end
    if boo_pin_two == false
        if boo_guess_pin_one == false && pin_two == guess_pin_one
                white += 1
                boo_guess_pin_one = true
                boo_pin_two = true
        elsif boo_guess_pin_three == false && pin_two == guess_pin_three
                white += 1
                boo_pin_two = true
                boo_guess_pin_three = true
        elsif boo_guess_pin_four == false && pin_two == guess_pin_four
                white += 1
                boo_pin_two = true
                boo_guess_pin_four = true
        end
    end
    if boo_pin_three == false
        if boo_guess_pin_two == false && pin_three == guess_pin_two
                white += 1
                boo_pin_three = true
                boo_guess_pin_two = true
        elsif boo_guess_pin_one == false && pin_three == guess_pin_one
                white += 1
                boo_guess_pin_one = true
                boo_pin_three = true
        elsif boo_guess_pin_four == false && pin_three == guess_pin_four
                white += 1
                boo_guess_pin_four = true
                boo_pin_three = true
        end
    end
    if boo_pin_four == false
        if boo_guess_pin_two == false && pin_four == guess_pin_two
                white += 1
                boo_guess_pin_two = true
                boo_pin_four = true
        elsif boo_guess_pin_three == false && pin_four == guess_pin_three
                white += 1
                boo_guess_pin_three = true
                boo_pin_four = true
        elsif boo_guess_pin_one == false && pin_four == guess_pin_one
                white += 1
                boo_guess_pin_one = true
                boo_pin_four = true
        end
    end
    puts "#{red} #{white}"
    num_guesses += 1
    if red == 4
        correct_guess = true
    end
end
puts "#{num_guesses} guesses"
gets.chomp
