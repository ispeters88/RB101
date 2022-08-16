# Find the next perfect square!


# You might know some pretty large perfect squares. But what about the NEXT one?
# 
# Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. 
# Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.
# 
# If the parameter is itself not a perfect square then -1 should be returned. You may assume the parameter is non-negative.



## Problem/Data ##
# input - integer
# output - integer
# rules/reqs
#   1) input integer will be non-negative   * could be 0? *
#   2) input integer does not have to be a perfect square, in which case we should return -1
#   3) if input integer is a perfect square, then we return the next perfect square

def find_next_square(sq)
  root = Math.sqrt(sq)
  root.to_i == root ? (root.to_i + 1) ** 2 : -1
end



## Examples ##

p find_next_square(121)  # 144, "Wrong output for 121")
p find_next_square(625)  # 676, "Wrong output for 625")
p find_next_square(319225)  # 320356, "Wrong output for 319225")
p find_next_square(15241383936)  # 15241630849, "Wrong output for 15241383936")
p find_next_square(155)  # -1, "Wrong output for 155")
p find_next_square(342786627)  # -1, "Wrong output for 342786627")


## Algorithm ##
# First, determine if input value is perfect square. If it is not, then return the value -1
# If it is a perfect square, add 1 to its square root, square that value, and return the result

# 1) Determine if input is perfect square
#     > Get square of input
#     > Compare that value to the integer form of the value
# 2) 