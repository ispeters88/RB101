# Rotating Matrices

=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. 
For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5

is:

9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.


=end

def rotate90(matrix)
  num_rows = matrix.size
  num_cols = matrix.sample.size
  new_matrix = Array.new(num_cols) { Array.new(num_rows) }

  num_rows.times do |row|
    num_cols.times do |col|
      new_matrix[col][row] = matrix[num_rows - row - 1][col]
    end
  end

  new_matrix
end


## Examples ##
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2



## Data/Algorithm ##
# > Given a 2D nested array, matrix -
#     1) Calculate the number of rows and number of columns - num_rows and num_cols
#     2) initialize a blank 2D array, size = num_cols
#     3) 2D iterate over #1) num_cols and #2) num_rows
#         > values row (outer) and col (inner)
#         > On each iteration, set new_matrix[row][col] = matrix[num_rows - row][col]


## Further Exploration ##
# Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?



def rotate_matrix(matrix, degrees)
  if degrees % 90 != 0
    puts "This is not built to handle that degree argument. Use a multiple of 90"
    return nil
  end

  new_matrix = matrix.clone.map(&:clone)

  (degrees / 90).times do 
    new_matrix = rotate90(new_matrix)
  end

  new_matrix
end


## Examples ##
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

=begin
matrix2 = 

3 7 4 2
5 1 0 8

matrix2.180 = 

8 0 1 5
2 4 7 3

matrix2.270 = matrix2.180.90 = 

2 8
4 0
7 1
3 5

=end

p rotate_matrix(matrix1, 180)#  = [[6, 9, 3], [2, 7, 4], [8, 5, 1]]

p rotate_matrix(matrix2, 270) # = [[]]

p rotate_matrix(matrix2, 360)