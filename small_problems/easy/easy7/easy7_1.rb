# Combine Two Lists
# 
# Write a method that combines two Arrays passed in as arguments, 
# and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
# 
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.


## Problem ##
# input - two arrays
# output - new array
# rules/reqs
#   1) both input arrays are non-empty
#   2) arr1.size == arr2.size
#   3) return value should be a new array object
# ?
#   1) the instructions state to take the elements "in alernation", but don't explicity state which array to start with
#       The example provided implies we start with the first array, so I will use that assumption in my solution

def interleave_loop(arr1, arr2)
  new_arr = Array.new
  arr1.size.times do |idx|
    new_arr << arr1[idx]
    new_arr << arr2[idx]
  end
  new_arr
end

## Examples ##
p interleave_loop([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']

## Data/Algorithm ##
# > Given two arrays, arr1 and arr2 -
#     1) iterate over the size of the two arrays (we know that sizes are equal)
#     2) On each iteration, push arr1[i] and arr2[i] into a new array

## Further Exploration ##
# Take a few minutes to read about Array#zip. #zip doesn't do the same thing as interleave, 
# but it is very close, and more flexible. 
# In fact, interleave can be implemented in terms of zip and one other method from the Array class. 
# See if you can rewrite interleave to use zip.

def interleave_zip(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave_zip([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']