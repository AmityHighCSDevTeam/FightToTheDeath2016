
grid_number = gets.chomp.to_i

# loops through each grid
(1..grid_number).each do |e|
    rows_columns = gets.chomp.split
    all_rows_array = []
    finalProduct = nil

    # create array of row arrays
    (0..rows_columns[0].to_i - 1).each do |current_row|
        all_rows_array[current_row] = gets.chomp.split
    end

    # loop through each row index because both index and value at that index will be referenced in the loop
    (0..all_rows_array.size - 1).each do |row_index|
        row = all_rows_array[row_index]

        # loop through each number of each row
        (0..row.size - 1).each do |number_index|

            # find horizontal product if applicable
            if number_index <= rows_columns[1].to_i - 4
                product = 1
                # multiply product by next three numbers to the right
                row[number_index..number_index + 3].each { |e| product *= e.to_i}

                # only update final product if it hasn't been set yet or if a bigger number has been found
                if finalProduct.nil?
                    finalProduct = product
                elsif product > finalProduct
                    finalProduct = product
                end
            end

            # find vertical product if applicable
            if row_index <= all_rows_array.size - 4
                product = 1
                # multiply product by next three numbers below it
                (row_index..row_index + 3).each do |index|
                    product = product * all_rows_array[index][number_index].to_i
                end
                # only update final product if it hasn't been set yet or if a bigger number has been found
                if finalProduct.nil?
                    finalProduct = product
                elsif product > finalProduct
                    finalProduct = product
                end
            end

            # find negative diagonal product if applicable
            if row_index <= all_rows_array.size - 4 and number_index <= rows_columns[1].to_i - 4
                product = 1
                # multiply product by next row down and one index over in each iteration
                (row_index..row_index + 3).each do |index|
                    product = product * all_rows_array[index][number_index + index - row_index].to_i
                end
                # only update final product if it hasn't been set yet or if a bigger number has been found
                if finalProduct.nil?
                    finalProduct = product
                elsif product > finalProduct
                    finalProduct = product
                end
            end

            # find positive diagonal product if applicable
            if row_index >= 3 and number_index <= rows_columns[1].to_i - 4
                product = 1
                # get number from 3 rows up and 3 to the right, and move down one row and back one index each iteration
                (row_index - 3..row_index).each do |index|
                    product = product * all_rows_array[index][number_index - index + row_index].to_i
                end
                # only update final product if it hasn't been set yet or if a bigger number has been found
                if finalProduct.nil?
                    finalProduct = product
                elsif product > finalProduct
                    finalProduct = product
                end
            end

        end
    end
    puts finalProduct
end
