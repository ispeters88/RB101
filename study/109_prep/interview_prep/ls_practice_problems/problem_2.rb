# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

## problem & data structures ##
# input - array
# output - integer, or `nil` (see rules below)
# goal - find a subsequence of 5 (consecutive) elements from input array, such that the sum of the 5 elements is the highest amongst all possible 5-element subsequences
# rules/reqs
#   1) array contains integers
#         > can be +/-/0 (implicitly)
#   2) possible for the input array to contain < 5 elements. In this case, return nil
#   3) if array contains >= 5 elements, return the smallest possible sum of all 5 element subsequences

def get_all_fives(numbers)
  arr_size = numbers.size
  numbers.each_cons(5).to_a
end

def minimum_sum(numbers)
  return nil if numbers.size < 5

  fives = get_all_fives(numbers)
  fives.map(&:sum).min
end


## examples ##
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

## algorithm ##
# Calculate size of array; if strictly less than 5, return `nil`
# Find and store off all 5-consecutive element subsequences
# Iterate over the subsequences using transformation to extract the sum of each
# Return the minimum sum of those subsequence sums
# 


# The tests above should print "true".