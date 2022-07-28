# Rotation (Part 2)


# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.
# 
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# 
# You may assume that n is always a positive integer.

## Problem ##
# input - number (what type? see questions, below), integer (count of digits to rotate)
# output - number
# rules/reqs
#   1) rotate the n rightmost digits of the input number
#   2) 
# questions
#   1) What type can the input number be - integer only? Float? etc
#       For the sake of proceeding, I will assume integer; all the provided examples are ints so this seems reasonable

require "pry-byebug"

def rotate_array(arr)
  new_arr = arr.clone
  new_arr[arr.size - 1] = new_arr.shift
  new_arr
end

def rotate_rightmost_digits(num, n)
  # split num into two arrays containing the non-rotating (left) and rotating (right) digits
  place_value = 10 ** n
  left_digits, right_digits = num.divmod(place_value)

  rotate_array(right_digits.digits.reverse).join.to_i + left_digits * place_value
end

## Examples ##
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


## Data/Algorithm ##
# > Given an integer, num, and a positive integer, n -
#     1) Split num into two parts - the rightmost n digits, and the rest of the number
#         1a) create an array containing all the digits of num, then create two arrays to satisfy step #1
#     2) Rotate the rightmost n digits by 1
#     3) Add the rotated rightmost digits back onto the end of the rest of the original number num
