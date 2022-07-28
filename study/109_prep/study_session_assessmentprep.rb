# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous
# subarray of which the sum ≥ s. If there isn't one, return 0 instead.

## Problem/Data ##
# input - array (arr), integer (s)
# output - integer
# rules/reqs
#   1) input array contains positive integers only
#   2) return value should be the length of the shortest contiguous subarray from input array, for which the subarray's sum is
#      >= s
#   3) If no such subarray exists, return 0

def find_all_subs(arr)
  subs = Array.new
  last_idx = arr.size - 1
  0.upto(last_idx) do |i|
    i.upto(last_idx) do |k|
      subs << arr[i..k]
    end
  end

  subs
end

def min_sub_length(arr, s)
  subs = find_all_subs(arr)
  lengths = subs.select { |subarr| subarr.sum >= s }.map(&:length)
  lengths.empty? ? 0 : lengths.min
end


## Examples ##

p min_sub_length([2,3,1,2,4,3], 7) # == 2
p min_sub_length([2,3,1,2,4,3], 7) #== 2
p min_sub_length([1, 10, 5, 2, 7], 9) #== 1
p min_sub_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) #== 4
p min_sub_length([1, 2, 4], 8) #== 0

## Algorithm ##
# > Given an array _arr_ and an integer _s_
# Find all possible contiguous subarrays of arr
# Select those subarrays with sum > s and calculate the length of each
# Return the minimum value of these lengths

# To find all possible contiguous subarrys of arr
#   1) Initialize a variable _subs_ to an empty Array object
#   2) Iterate over the values in arr with parameter i; on each iteration:
#       > iteration over the remaining values in arr with parameter k; on each iteration:
#           > take a slice of arr from i to k. Add it to subs
#   3) Return subs









=begin
# Brenno's solution + Srdjan's recommendation


# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous
# subarray of which the sum ≥ s. If there isn't one, return 0 instead.


# Input: Array of Integers, Integer
# Output: Integer (minimal length of contiguous subarray of which sum >= int)

# Rules:
# Return 0 if no contiguous subarray meet the criteria
# If any element in the array is equal to or greater than input integer, return 1


# Mental Model:
## Iterate over input array and find all contiguous subarrays,
## Store the subarrays whose elements add up to the target integer or more.
## Compare the stored subarrays, find those with the shortest length
## Return length.

# Algorithm:
## Initialize empty array 'subarrays'
## Iterate over input array starting at index 0 (start_index) and ending at string.length - 1
## Begin another iteration starting at start_index and ending at string.length - 1 (end_index)
### find subarrays starting at start_index and ending at end_index
### If the sum of the subarray elements is greater than or equal to target integer, push subarray to `subarrays`
## If `subarrays` is empty, return zero. 
## Otherwise, sort `subarrays` by size and return the minimum element's size.\


def min_sub_length(numbers, target)
  all_subs = find_all_subs(numbers)
  subs_greater_than_target = find_greater_than_target(all_subs, target)
  find_minimal_length(subs_greater_than_target)
end


def min_sub_length(numbers, target)
  subarrays = Array.new(0)
  (0...numbers.size).each do |start_index|
    (start_index...numbers.size).each do |end_index|
      subarray = numbers[start_index..end_index]
      subarrays << subarray if subarray.inject(:+) >= target
    end
  end
  subarrays.empty? ? 0 : subarrays.min_by {|sub| sub.size}.size
end


=end