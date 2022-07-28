# Transpose MxN

# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.
# 
# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. 
# Any matrix can be transposed by simply switching columns with rows.
# 
# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

## Problem ##
# input/output/rulesreqs - same as previous exercise
# questions
#   1) are we still returning a new array and not modifying the original? 
#       > will assume yes for solution below

def transpose(matrix)
  num_rows = matrix.size
  num_cols = matrix.sample.size
  new_matrix = Array.new(num_cols) { Array.new(num_rows) }

  num_cols.times { |col| num_rows.times { |row| new_matrix[col][row] = matrix[row][col] } }

  new_matrix
end


## Examples ##

p transpose([[1, 2, 3, 4]])# == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]])# == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])# ==
  #[[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]])# == [[1]]

## Data/Algorithm ##
# > Given a square 2D nested array, matrix -
#     1) Calculate the number of rows and number of columns - num_rows and num_cols
#     2) initialize a blank 2D array, size = num_cols
#     3) 2D iterate over #1) num_cols and #2) num_rows
#         > values row (outer) and col (inner)
#         > on each iteration, set the value of new_matrix[col][row] = matrix[row][col]
#     4) return new_matrix

=begin
1 2 3 4
4 3 2 1
9 8 7 6

1 4 9
2 3 8
3 2 7
4 1 6
=end


## Further Exploration ##
# 

=begin
Some of you may have been able to solve this exercise without doing a thing; if you determined your matrix size dynamically 
in the previous exercise instead of relying on the 3 x 3 requirement, you solved both problems in one step. 
However, almost everybody probably did a strict 3 x 3 solution for the first exercise.

How do you think you would have fared if you had to start with this exercise? 
How much harder would you have found the solution to be if you hadn't encountered and solved the 3x3 case first?
=end

# > My initial solution to hard_3 did not assume a size, but did assume a square matrix. 
# It would probably have been a bit harder if I had started with this exercise, as the initial step would have
# been two-fold (calc number of rows and number of columns) instead of just calculating a single size varible. 
# But, probably not all that much harder.