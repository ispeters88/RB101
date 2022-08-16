# Find all pairs
# 
# You are given array of integers, your task will be to count all pairs in that array and return their count.
# 
# Notes:
# 
# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000


## problem ##
# input - array
# output - 
# rules/reqs
#   1) input array contains integers
#   2) input array have any number of elements >= 0
#   3) pairs are non-overlapping; if an integer is used in one pair, it can't be used in another pair

def pairs(array)
  num_counts = Hash.new(0)

  array.each { |num| num_counts[num] += 1 }
  array.size < 2 ? 0: num_counts.map { |key, val| val / 2 }.inject(&:+)
end


## examples ##
p pairs([2, 5, 4, 2, 4, 6, 6, 1, 1231, 51, 23123, 1231])
p pairs([])
p pairs([5])
p pairs([2, 2, 5, 5, 7, 7, 7, 7])


## algorithm ##
# Initialize an empty hash object, with default value 0
# Iterate over the elements in the input array
#   > Add 1 to the value associated with the key represented by the current element
# Divide the value for each number by 2.
# Add all the resulting values together and return that value