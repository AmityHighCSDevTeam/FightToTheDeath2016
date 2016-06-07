
code = gets.chomp.delete!' '    # the code selected by the codemaker
game_over = false   # Turns true when the code is correctly guessed
guess_count = 0         # Counts total number of guesses taken

until game_over == true do  # makes the game loop until code is correctly guessed

        guess = gets.chomp.delete!' '   # the guess of the codebreaker
        code_copy = code.clone  # A copy of the code that is refreshed between runs of the loop, as to not mess up the original code
        correct_peg = 0         # tallies up pegs with the right color/position
        correct_color_peg = 0   # tallies up pegs which have the right color in the wrong position - does not include the ones in correct_peg
        guess_count += 1
 
    if code == guess    #tests if the code is correctly guessed
        game_over = true
        puts '4 0'
        print guess_count
        print  ' guesses'

    else

        if guess[0] == code[0]      # testing if pegs are the right color, 1 spot at a time
            correct_peg += 1    # Tallies up number of correct pegs
            code_copy.slice!(0) # Removes already counted pegs from the scan for "color but not position" matches later
        end
        if guess[1] == code[1]
            correct_peg += 1
            code_copy.slice!(1)
        end
        if guess[2] == code[2]
            correct_peg += 1
            code_copy.slice!(2)
        end
        if guess[3] == code[3]
            correct_peg += 1
            code_copy.slice!(3)
        end
        print correct_peg
        print ' '

        counter0 = 0    # counts for searching guess
        counter1 = 0    # counts for searching code_copy
        change_made = false # determines if a match was found, so that both strings can be searched through again

        while counter0 <= guess.length - 1      # counting through guess... I cant use a for loop here cause IT INCREMENTS AT THE FUCKING END DAMMIT I CANT HAVE THAT WHY MUST YOU DO THIS TO ME CRUEL WORLD (FUCK YOU WORLD)
            counter1 = 0

            while counter1 <= code_copy.length - 1  # counting through code_copy

                if guess[counter0] == code_copy[counter1] && guess.length > 0
                    correct_color_peg += 1
                    code_copy.slice!(counter1)
                    guess.slice!(counter0)      # removes counted pegs to prevent recounting later
                    change_made = true
                    break
                else
                    counter1 += 1
                end
            end
            counter0 += 1
            if change_made == true          # resets counter to rescan both strings from the start
                counter0 = 0
                change_made = false
            end
        end
        if correct_color_peg + correct_peg > 4      #Corrects an error where if every letter in the guesss was in the code there would be an extra peg counted as incorrect position. Ex output: 2 3
            correct_color_peg = 4 - correct_peg
        end
        puts correct_color_peg
    end
end
