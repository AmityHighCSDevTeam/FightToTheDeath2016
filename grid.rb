# The pdf says that there are 8 different directions, but there are only 4 diffent orientations the adjancent thingys can be... no front/back differentiation in multiplication.
repeats = gets.chomp.to_i   # Number of cases: aka N on the pdf
for i in 1..repeats     # Specifies number of times to run - equal to number of cases
  input = gets.chomp.split    # Raw input of R and C
  rows = input[0].to_i        # Self Explanatory
  columns = input[1].to_i     # ^
  array = Array.new(rows) {Array.new(columns)}  # Array to store values in

  for j in 0..rows - 1                    # Places input into array - start
    transfer = gets.chomp.split           #
    for k in 0..columns - 1               #
      array[j][k] = transfer[k].to_i      #
    end                                   #
  end                                     # -End
  #                  *all horizontal prods*   *All vertical products*  *Every diagonal product - x2 for 2 diagonals*
  products = Array.new(rows * (columns - 3) + (rows - 3) * columns + 2 * (rows - 3) * (columns - 3) , 0)     # Array to store every procduct produced

  for j in 0..rows - 1             # Computing every horizontal product -Start
    for k in 0..columns - 4
      products[j * (columns - 3) + k] = array[j][k] * array[j][k + 1] * array[j][k + 2] * array[j][k + 3]
    end  #     ^*This stuff assigns unique indexes to products - because logic*
  end                              # -End

  for j in 0..rows - 4             # Computing every vertical product -Start
    for k in 0..columns - 1
      products[rows * (columns - 3) + j * (columns - 3) + k] = array[j][k] * array[j+ 1][k] * array[j+ 2][k] * array[j+ 3][k]
    end  #     ^*This stuff assigns unique indexes to products avoiding that other one as well - because logic*
  end                              # -End

    #p products
    #print "hallo its amesage"
  for j in 0..rows - 4             # Computing every diagonal(top left to bottom right) product -Start
    for k in 0..columns - 4
      products[rows * (columns - 3) + (rows - 3) * columns + j * (columns - 3) + k] = array[j][k] * array[j+ 1][k + 1] * array[j+ 2][k+ 2] * array[j+ 3][k + 3]
    end  #     ^*This stuff assigns unique indexes to products avoiding that other ones as well - because logic*
  end                              # -End
  for j in 3..rows - 1             # Computing every diagonal(top right to bottom left) product -Start
    for k in 0..columns - 4
      products[rows * (columns - 3) + (rows - 3) * columns + (rows - 3) * (columns - 3) + (j - 3) * (columns - 3) + k] = array[j][k] * array[j - 1][k + 1] * array[j - 2][k + 2] * array[j - 3][k + 3]
    end
  end                              # -End

  products.sort!

  #p products
  #p array
  puts products.last
end
