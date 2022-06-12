# Running Totals

# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

def sum_up_to(arr, index)
  sum = 0
  arr.each_with_index { |n, idx| sum += n if idx <= index }
  sum
end

def running_total(arr)
  run_arr = Array.new(0)
  arr.each_with_index do |num, idx|
    idx == 0 ? run_arr << num : run_arr << sum_up_to(arr, idx)
  end
  run_arr
end

## Problem ##
# input - array
# output - array
# implicit assumption on return value - separate array from input value
# questions
#   1) can an element appear twice in the input array?
#     * for my solution, I'll assume it cannot

## Examples ##
p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []


## Data/Algorithm ##

# > Given an array of numbers, arr
#     1) Initialize a new empty array, run_arr
#     2) Iterate over arr - on each iteration, 
#         2a) if this is the first element in arr, add it to run_arr
#         2b) otherwise, find the sum of the current value plus all the previous values in the array. Add this to run_arr
#     3) return run_arr


## LS Solution ##

# this is clever!

def running_total_LS(array)
  sum = 0
  array.map { |value| sum += value }
end


## Further exploration ##

#Try solving this problem using Enumerable#each_with_object or
# Enumerable#inject (note that Enumerable methods can be applied to Arrays).

# using Enumerable#each_with_object

def running_total_further(arr)
  sum = 0
  arr.each_with_object([]) do |num, run_arr| 
    sum += num
    run_arr << sum
  end
end

p running_total_further([14, 11, 7, 15, 20])