# Merge Sorted Lists

# Write a method that takes two sorted Arrays as arguments, and returns a new Array 
# that contains all elements from both arguments in sorted order.
# 
# You may not provide any solution that requires you to sort the result array. 
# You must build the result array one element at a time in the proper order.
# 
# Your solution should not mutate the input arrays.


## Problem ##
# input - two arrays
# output - one array
# rules/reqs
# questions
#   1) what do we know about the sizes of the arrays? Can we assume they are the same size
#       > implicitly from the examples, we cannot.

require "pry-byebug"

def sort_arrays(arr1, arr2)
  arr1.size <= arr2.size ? [arr1, arr2] : [arr2, arr1]
end


def merge(arr1, arr2)
  result = Array.new
  longer_idx = 0
  shorter, longer = sort_arrays(arr1, arr2)
  max = shorter.size

  shorter.each_with_index do |i, shorter_idx|
    longer_idx += longer[longer_idx..].select { |k| k < i }.each { |long| result << long }.size
    result << i
    i += 1
  end

  longer[longer_idx..].each { |long| result << long }

  result
end

## Examples ##
p merge([1, 5, 9], [2, 6, 8])#  == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2])#  == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5])#  == [1, 4, 5]
p merge([1, 4, 5], [])#  == [1, 4, 5]



## Data/Algorothm ##
# > Given two arrays, arr1 and arr2 - 
#     1) get the sizes of the two arrays
#     2) initialize an empty array, result
#     3) iterate over the smaller of the two
#         > on each iteration, select all elements from the longer array that are 
#           smaller than the current value from the shorter array, and add them to the result array
#         > add the current value to result
#     4) After iteration is complete, add all remaining elements from the longer array
