# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# The tests above should print "true".

## problem ##
# input - Array
# output - Array
# goal - find the two numbers "closest together" amongst all numbers in the input array, and return them as elements of a 2-item Array
# rules
# 1) input array contains only integers
# 2) integers can be positive (implicit) - not clear if negative/zero possible
# 3) "closest together" - the difference between the two numbers is the smallest of all differences


def closest_numbers(numbers)
  pairs = numbers.combination(2).to_a
  closest_index = 0

  (0...pairs.size).each do |cur_idx|
    closest_index = cur_idx if pairs[cur_idx].inject(&:-).abs < pairs[closest_index].inject(&:-).abs
  end

  pairs[closest_index]
end


## examples ##
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

## algorithm ##
# Find and store off all possible two number combinations
#   > these should be saved off as 2 item subarrays within a larger array

#   > think we can use Array#combination(2) to accomplish this.

# Initialize a local variable closest_index to 0
# Iterate through those combinations/subarrays
#   > Finding the difference between the two values
#   > Checking if that difference is less than the difference found at index position closest_index
#   > if it is, set closest_index to the current index position
# Return the 2-number combo at the index position closest_index
