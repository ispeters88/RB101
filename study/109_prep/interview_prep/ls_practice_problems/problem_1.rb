# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.


## problem ##
# input - array
# output - array
# goal - transform the input array, mapping each input value to a count of how many other input values are smaller than it
# rules/reqs
#   1) only unique values should be considered when counting - no duplicates
#   2) input array contains numbers only


def smaller_numbers_than_current(numbers)
  unique_vals = numbers.uniq

  numbers.map do |number|
    unique_vals.count { |val| val < number }
  end
end



## examples ## 
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".


## algorithm ##
# Create a new array object containing only the unique values of the input array
# Nested iteration over each element in input array
#   > on each iteration, perform a second iteration and get the count of values that are strictly smaller 
#     than the current element
# Return the resulting transformed array