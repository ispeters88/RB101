# Array Average

# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers. 
# Your result should also be an integer.

def average(int_arr)
  int_arr.sum / int_arr.count
end

# LS supplied solution uses #reduce / #inject to sum the integers in the array. not sure whether this is preferred to #sum


# Further exploration

def average_float(int_arr)
  int_arr.sum.to_f / int_arr.count
end

## Problem ##
# input - an array containing integers
# output - integer
# requirements/rules
#   1) input array will never be empty
#   2) elements in input array will always be positive integers
#   3) output value should always be an integer
#   4) output should equal the average of all the numbers in the array
# questions

## Examples ##
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average_float([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# these tests should return true

## Data/Algorithm ##
# Given an array containing positive integers, return an integer that equals the average of all the numbers
# > Given an array, int_arr - 
#     1) Iterate over the elements in the array
#         1a) calculate the sum of the element values
#         1b) calculate the number of elements
#     2) Return the sum divided by the number of elements (integer division)
