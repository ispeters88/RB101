# Multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
# and then computes the sum of those multiples. For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def is_multiple?(num, value_arr)
  value_arr.map { |val| num % val == 0 }.reduce(:|)
end

def multisum(num)
  check_arr = [3, 5]
  multiples_arr = (1..num).to_a.select { |n| is_multiple?(n, check_arr) }
  multiples_arr.sum
end

## Problem ##
# input - number
# output - number
# requirements/rules
#   1) return value should be the sum of all multiples of 3 and/or 5 between 1 and input number
#   2) input number is an integer greater than 1
# questions

## Examples #3
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

## Data/Algorithm ##
#   1) create a running sum
#   2) create a range from 1 to input number, inclusive
#   3) ignore any numbers in range that are NOT multiples of either 3 or 5
#   4) add all the other numbers to running sum
#   5) return sum