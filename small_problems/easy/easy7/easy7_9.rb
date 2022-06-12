# Multiply All Pairs

# Write a method that takes two Array arguments in which each Array contains a list of numbers, 
# and returns a new Array that contains the product of every pair of numbers that can be formed between 
# the elements of the two Arrays. The results should be sorted by increasing value.
# 
# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |subarr| subarr.inject(&:*) }.sort
end

## Examples ##
p multiply_all_pairs([2, 4], [4, 3, 1, 2])# == [2, 4, 4, 6, 8, 8, 12, 16]


## Data/Algorithm ##
# > Given two arrays, arr1 and arr2, containing at least 1 number each - 
#     1) Create a 2D array containing all combinations of arr1 and arr2
#     2) Iterate through this 2D array and map each subarray into a single integer, by finding the product of the 
#         numbers in the subarray. The result should be a 1D array
#     3) Sort the 1D array from step #2, in increasing value
#     4) return the sorted 1D array
