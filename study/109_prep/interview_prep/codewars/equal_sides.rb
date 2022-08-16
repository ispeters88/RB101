# Equal Sides Of An Array

# You are going to be given an array of integers. 
# Your job is to take that array and find an index N where the sum of the integers 
# to the left of N is equal to the sum of the integers to the right of N. 
# If there is no index that would make this happen, return -1.

## Problem ##
# input - array
# output - integer
# rules/reqs - 
#   1) input array contains integers
#   2) output integer should be the first index within the input array, such that
#       > sum of all integers to left of index is euqal to the sum of the integers to the right of N
#   3) if no such index, return -1

def find_even_index(arr)
  arr.each_with_index do |_, idx|
    return idx if arr[0...idx].sum == arr[idx + 1..].sum
  end
  -1
end

## Examples ##

p find_even_index([1,2,3,4,3,2,1])# ,3)
p find_even_index([1,100,50,-51,1,1])# ,1)
p find_even_index([1,2,3,4,5,6])# ,-1)
p find_even_index([20,10,30,10,10,15,35])# ,3)
p find_even_index([20,10,-80,10,10,15,35])# ,0)
p find_even_index([10,-80,10,10,15,35,20])# ,6)
p find_even_index(Array(1..100))# ,-1)
p find_even_index([0,0,0,0,0])# ,0,"Should pick the first index if more cases are valid")
p find_even_index([-1,-2,-3,-4,-3,-2,-1])# ,3)
p find_even_index(Array(-100..-1))# ,-1)


## Algorithm ##
# Iterate over the input array. Create subarrays containing all elements to left and to right of current element
# Get sum of each pair of subarrays and compare them to each other. The first time they are equal, return the current index value
# If we never return from that iteration, return -1

# 1) Iterate over the array with the index available. on each iteration:
#     > take two slices of the array - one from 0 to cur_index - 1, one from cur_index + 1 to end
#     > get sum of both slices, check if they are equal. if so, return current index
#     > otherwise, keep going
# 2) if we get to end of iteration, return -1