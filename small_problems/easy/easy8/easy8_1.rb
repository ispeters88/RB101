# Sum of Sums

# Write a method that takes an Array of numbers and then 
# returns the sum of the sums of each leading subsequence for that Array. 
# You may assume that the Array always contains at least one number.

## Problem ##
# input - array
# output - numeric, sum of values in input array
# rules/reqs 
#   1) input array contains numbers - at least one
# questions
#   1) what type of numeric should we return?

def sum_of_sums(int_arr)
  sum_arr = Array.new
  size = int_arr.size

  int_arr.each_with_index do |num, idx|
    sum_arr << num * (size - idx)
  end

  sum_arr.inject(&:+)
end

def sum_of_sums_short(int_arr)
  size = int_arr.size
  Array.new(size) { |idx| int_arr[idx] * (size - idx) }.inject(&:+)
end

## Examples ##
p sum_of_sums_short([3, 5, 2]) #  == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums_short([1, 5, 7, 3])#   == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums_short([4])#   == 4
p sum_of_sums_short([1, 2, 3, 4, 5])#   == 35

## Data/Algorithm #3
# > Given an array of integers, int_arr - 
#     1) initialize an array containing the "leading subsequences of the array"
#         1a) leading subsequence - subset of int_arr that contains the first value of int_arr (int_arr[0])
#         1b) observation: the sum contains
#               > (int_arr.size - n) * int_arr[n]. for n in int_arr.size
#     2) add the values in those subsequences together