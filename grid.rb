# since i don't need n anywhere else i just put it right into the loop header
gets.chomp.to_i.times do
  # split the dimensions into 2 vars and parse integers
  r, c = gets.chomp.split.map(&:to_i)
  # read in grid
  g = (1..r).each_with_object([]) { |_, h| h << gets.chomp.split.map(&:to_i) }
  # the list of max row, column, and diagonal products
  products = []
  # what a fucking hack
  # so the first time i run the loop i scan rows and down-right diagonals.
  # then after that i rotate and flip the array then invert the dimensions.
  # transpose so i can check columns while pretending they're rows,
  # and reverse so i can check down-left diagonals while pretending they're
  # down-right diagonals. i could just separate the code, but this keeps it
  # compact and honestly isn't that shit once you understand wtf i'm doing.
  # update: nope its still shit. i was probably incredibly drunk last night...
  2.times do
    # loops through possible starting points for scanning the rows
    # v is the column of the starting point, a is the array that holds a bunch
    # of products that we will get the max of later
    products << (0..c - 4).each_with_object([]) do |v, a|
      # go through each row and push the maximum product that starts in column v
      a << g.map do |row|
        row[v] * row[v + 1] * row[v + 2] * row[v + 3]
      end.max
      # go through each valid starting row for diagonal. v1 is the starting row,
      # a1 is the array of diagonal products
      a << (0..r - 4).each_with_object([]) do |v1, a1|
        a1 << g[v1][v] * g[v1 + 1][v + 1] * g[v1 + 2][v + 2] * g[v1 + 3][v + 3]
      end.max
    end.max
    g = g.transpose.map(&:reverse)
    r, c = [c, r]
  end
  puts products.max
end
