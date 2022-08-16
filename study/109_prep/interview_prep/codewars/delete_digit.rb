# Simple Fun #79: Delete a Digit

# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.


# [input] integer n
# 
# Constraints: 10 ≤ n ≤ 1000000.
# 
# [output] an integer

## Problem ##
# input - integer
# output - integer
# rules/reqs
#   1) input value is between 10 and 1000000
#   2) output should be the maximum number that can be formed by deleting one digit

def find_all_nums(n)
  nums = Array.new
  digits = n.digits.reverse

  0.upto(digits.size - 1) do |num|
    nums << digits[0...num] + digits[num+1..]
  end

  nums.map { |subarr| subarr.join.to_i }
end

def delete_digit(n)
  numbers = find_all_nums(n)
  numbers.max
end

# p find_all_nums(152)
# p find_all_nums(1001)
# p find_all_nums(10)


## Examples 

# For n = 152, the output should be 52;
# 
# For n = 1001, the output should be 101.

p delete_digit(152)   # 52
p delete_digit(1001)  # 101
p delete_digit(10)    # 1


## Algorithm ##
# Create an array and add all possible variations of the input number with 1 digit deleted
# Return the maximum value of that array

# finding possible variations with a digit deleted

# 1) Initialize local var _nums_ to empty Array object 
# 2) Convert input integer into an array
# 3) Iterate over digit array with index value available and create new array with value at that index value deleted. Add this
#    to nums
# 4) return nums