# Transpose 3x3

=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array
and all of the sub-Arrays has 3 elements. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array
#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. 
An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. 
Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. 
For example, the transposition of the array shown above is:

1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. 
Note that there is a Array#transpose method that does this -- you may not use it for this exercise. 
You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.
=end

## Problem ##
# input - 2D nested array
# output - new 2D nested array
# rules/reqs 
#   1) return value is a distinct array object from the input matrix. Input matrix should not be modified
#   2) input matrix is 3x3

def transpose(matrix)
  size = matrix.size
  new_matrix = Array.new(3) { Array.new(3) }
  
  size.times do |row|
    size.times do |col|
      new_matrix[col][row] = matrix[row][col]
    end
  end

  new_matrix

end



## Examples #3

 matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

## Data/Algorithm ##
# > Given a square 2D nested array, matrix -
#     1) Calculate the size of matrix
#     2) initialize a blank square 2D array, new_matrix with row and column size = size
#     3) Iterate over the size from #1, nested x2
#         > values row (outer) and col (inner)
#         > on each iteration, set the value of new_matrix[col][row] = matrix[row][col]
#     4) return new_matrix


## Further Exploration ##

# Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, 
# then copy the results back into the array specified by the argument. 
# For this method, don't use this approach; write a method from scratch that does the in-place transpose.

## Data/Algorithm ##
# > # > Given a square 2D nested array, matrix -
#     1) Calculate the size of matrix
#     2) initialize a blank square 2D array, new_matrix with row and column size = size
#     3) create a clone of matrix - clone
#     4) Iterate over the size from #1, nested x2
#         > values row (outer) and col (inner)
#         > Set value of matrix[col][row] = clone[row][col]

require "pry-byebug"

def transpose_fe(matrix)
  size = matrix.size
  clone = matrix.clone.map(&:clone)

  size.times { |row| size.times { |col| matrix[col][row] = clone[row][col] } }
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose_fe(matrix)

p new_matrix# == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]