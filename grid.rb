print "Please insert number of cases. "
num_cases = gets.chomp.to_i
#Finding the number of cases.
for which_case in 1..num_cases
    rows = "" #Resetting the array that contains one row
    print "Please enter the number of rows and columns in case number #{which_case}: " #Asking for the size of each grid
    size = gets.chomp.split(" ") #Splits the input into an array with number of rows and number of columns
    num_rows = size[0].to_i #Setting the number of rows to num_rows
    num_columns = size[1].to_i #Setting the number of columns to num_columns
    numbers = [] #An array that will hold all the numbers
    for which_row in 1..num_rows
        print "Please enter row number #{which_row}: " #Asking for each row in the grid
        rows = [gets.chomp.split(" ")] #Taking the grid and putting it into an array
        for next_num in 0...rows[0].size
            rows[0][next_num] = rows[0][next_num].to_i
            numbers <<(rows[0][next_num])#Adding numbers to the array
        end
    end
    highest_total = 0 #Variable that holds the highest total in the case so far
    current_total = 0 #Variable that holds the total of the row, column, or diagonal
    for which_number in 1..num_rows * num_columns
      if which_number + (3 * num_columns) <= num_rows * num_columns #Finding if the number is 4 or more away from the bottom so there is a column
        current_total = numbers[which_number].to_i * numbers[which_number + num_columns].to_i * numbers[which_number + num_columns + num_columns].to_i * numbers[which_number + num_columns + num_columns + num_columns].to_i #Finding the product of the column

      end
      if current_total > highest_total
        highest_total = current_total #setting the current total to the highest total so the highest total increases
        print "column"
      end
      if num_columns - 4 >= which_number % num_columns #Finding if the number is 4 or more away from the edge so there is a row
        current_total = numbers[which_number].to_i * numbers[which_number + 1].to_i * numbers[which_number + 2].to_i * numbers[which_number + 3].to_i #Finding the product of the row

      end
      if current_total > highest_total
        highest_total = current_total #setting the current total to the highest total so the highest total increases
        print "row"
      end
      if num_columns - 4 >= which_number % num_columns && which_number + (3 * num_columns) <= num_rows * num_columns #Finding if the number is 4 or more away from the right edge and if it is 4 or more away from the bottom so there is a diagonal
        current_total = numbers[which_number].to_i * numbers[which_number + num_columns + 1].to_i * numbers[which_number + num_columns + num_columns + 2].to_i * numbers[which_number + num_columns + num_columns + num_columns + 3].to_i #Finding the product of the diagonal
      end
      if current_total > highest_total
        highest_total = current_total #setting the current total to the highest total so the highest total increases
        print "diagonal"
      end
      if num_columns + 4 >= which_number % num_columns && which_number + (3 * num_columns) <= num_rows * num_columns #Finding if the number is 4 or more away from the left edge and if it is 4 or more away from the bottom so there is a diagonal
        current_total = numbers[which_number].to_i * numbers[which_number + num_columns - 1].to_i * numbers[which_number + num_columns + num_columns - 2].to_i * numbers[which_number + num_columns + num_columns + num_columns - 3].to_i #Finding the product of the diagonal
      end
      if current_total > highest_total
        highest_total = current_total #setting the current total to the highest total so the highest total increases
        print "diagonal"
      end
    end
    print highest_total #Printing out the highest total
    puts ""
end
