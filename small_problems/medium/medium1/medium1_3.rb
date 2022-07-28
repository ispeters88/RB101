# Rotation (Part 3)

# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
# Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
# The resulting number is called the maximum rotation of the original number.
# 
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
# You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
# 
# Note that you do not have to handle multiple 0s.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number_arr, n)
  number_arr[-n..-1] = rotate_array(number_arr[-n..-1])
  number_arr
end

def max_rotation(number)
  num_digits = number.digits.reverse
  size = num_digits.size
  size.times do |idx|
    num_digits = num_digits[0...idx] + rotate_rightmost_digits(num_digits[idx..], size - idx)
  end
  num_digits.join.to_i
end

p max_rotation(735291)# == 321579
p max_rotation(3)# == 3
p max_rotation(35)# == 53
p max_rotation(105)# == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146)# == 7_321_609_845


## Data/Algorithm ##
# > Given a number, n -
#     1) Iterate through the digits of the number. On each iteration, rotate all digits to the right of the current number
#         (including the current number)
#     2) After rotating the rightmost digits, use the new value for the next iteration
#         i.e. rotate destructively



## Further Exploration ##
# Assume you do not have the rotate_rightmost_digits or rotate_array methods. 
# How would you approach this problem? Would your solution look different? 
# Does this 3 part approach make the problem easier to understand or harder?
# 
# There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. 
# Can you create a solution that preserves zeros?


## The 3 part approach definitely made it easier to understand the mechanics of what needs to happen in this one, 
#  and seems like a good starting point, but was a bit more complicated than necessary
# This solution preserves zeros

require "pry-byebug"

def rotate(arr)
  last = arr.shift(1)
  arr + last
end

def max_rotation_fe(number)
  
  digits = number.digits.reverse
  size = digits.size
  #binding.pry

  size.times do |idx|
    digits = digits[0...idx] + rotate(digits[idx...size])
  end
  digits.join.to_i
end

# p max_rotation_fe(735291)# == 321579
# p max_rotation_fe(3)# == 3
# p max_rotation_fe(35)# == 53
# p max_rotation_fe(105)# == 15 # the leading zero gets dropped
# p max_rotation_fe(8_703_529_146)# == 7_321_609_845
p max_rotation_fe(2740034)

=begin 
7400342
7003424
7034240
7032404
7032044
7032044
7032044
=end