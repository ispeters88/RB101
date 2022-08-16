# Find the odd int
# * 10:12 *
# Given an array of integers, find the one that appears an odd number of times.
# 
# There will always be only one integer that appears an odd number of times.
# 
# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).


def find_it(nums)
  counts = Hash.new(0)

  nums.each do |num|
    counts[num] += 1
  end

  counts.map { |key, val| key if val.odd? }.compact.first
end

## problem ##
# input - arry
# output - integer
# rules/reqs
#   1) input array contains integers
#   2) exactly one element from input array has an odd element count
#   3) 

## examples ##
p find_it([7])
p find_it([0])
p find_it([1, 1, 2])
p find_it([0, 1, 0, 1, 0])
p find_it([1, 2, 2, 3, 3, 3, 4, 3, 3, 3, 2, 2, 1])

## algorithm ##
# Initialize an empty Hash object (counts) with default value 0
# Iterate over the input array (nums) and increment corresponding value in counts
# 
