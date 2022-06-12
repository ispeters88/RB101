# Odd

# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd_remainder?(number)
  number *= -1 if number < 0
  number.remainder(2) == 1
end

def is_odd?(number)
  number % 2 != 0
end

## Problem ##
# input - integer, n (can be any Int but can assume is valid)
# output - boolean value, based on odd/even nature of n
# requirements
#   1) return true if absolute value of n is odd
#   2) can't use #odd? or #even?
# questions
#   1) the problem description states explicitly what to do when the absolute value of n is odd (return true), but 
#      leaves unsaid what to do otherwise. Should we return false if the absolute value of n is even?
#         * Will assume yes for my solution

## Examples ##

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

## Data/Algorithm ##
# Integer value - can be negative/positive/0
# > Given a valid integer value, n - 
#     1) Calculate the absolute value of n
#     2) Check whether that absolute value is odd or even
#     3) Return true if step #2 returns odd, else return false