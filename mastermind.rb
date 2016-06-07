input_file = File.open('input.txt')

number_of_lines = input_file.readlines.size
input_file.rewind

answer_array = []
for i in 0..3 do
    answer_array[i] = input_file.read(1)
    input_file.seek(1, IO::SEEK_CUR)
end

for line in 2..number_of_lines do
    # reset for each new line
    pegs_in_correct_position = 0
    pegs_matching = 0
    
    # create clone so we can identify which letters were matched later on by setting them to 0
    temp_answer_array = answer_array.clone
    
    guess_letters_array = []
    for i in 0..3 do
        guess_letters_array[i] = input_file.read(1)
        input_file.seek(1, IO::SEEK_CUR)
    end
    
    # check for matches
    for letter in 0..3 do
        if answer_array[letter] == guess_letters_array[letter]
            pegs_in_correct_position += 1
            # set to 0 to prevent extra matches
            temp_answer_array[letter] = '0'
        end
    end
    
    # check for remaining pegs in different positions
    for letter in 0..3 do
        # compare every answer letter to the guess letter
        for answer_index in 0..3 do
            if temp_answer_array[answer_index] == guess_letters_array[letter]
                pegs_matching += 1
                # set to 0 to prevent extra matches
                temp_answer_array[answer_index] = '0'
                break
            end
        end
        end
        print pegs_in_correct_position
        print ' '
        print pegs_matching
        puts ''
    end
    print number_of_lines - 1
    print ' guesses'
    puts ''
    
input_file.close