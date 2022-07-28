# Multiplication table
# 
# Your task, is to create NxN multiplication table, of size provided in parameter.
# 
# for example, when given size is 3:

=begin

1 2 3
2 4 6
3 6 9

for given example, the return value should be: [[1,2,3],[2,4,6],[3,6,9]]

=end

def multiplication_table(size)
  result = Array.new

  (1..size).each do |row|
    (1..size).each do |col|
      result << row * col
    end
  end

  result.each_slice(size).map { |slice| Array.new(slice) }
end

p multiplication_table(5)

## Data/Algorithm ##
# > Given a number, size - 
#     1) initialize local var last_num, to the square of size
#     2) initialize a result array 
#     3) create a 2D matrix via double iteration -
#         > outer iteration - row
#         > inner iteration - col
#     4) add the value of row * col to the result array
#     5) 2D nest the result array by chunks of length == size