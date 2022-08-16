# Equal Sides Of An Array
# * 24:59 *
# You are going to be given an array of integers. 
# Your job is to take that array and find an index N where the sum of the integers 
# to the left of N is equal to the sum of the integers to the right of N. 
# If there is no index that would make this happen, return -1.
# 
# For example:
# 
# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the array, 
# the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.
# 
# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the array, 
# the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.
# 
# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.
# 
# Note: Please remember that in most programming/scripting languages the index of an array starts at 0.
# 
# Input:
# An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.
# 
# Output:
# The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.
# 
# Note:
# If you are given an array with multiple answers, return the lowest correct index.


#####


## problem ##
# input - array
# output - integer
# rules/reqs
#   1) input array contains integers
#   2) output integer should be a valid index position within input array, if one exists that satisfies
#       > sum of elements to left of index position is equal to sum of elements to right of index position
#   3) if no index position satisfies this, return -1
#   4) otherwise, return the index position
#   5) there may be multiple answers. if so, return the lowest valid index

def find_even_index(nums)
  nums.each_with_index do |_, idx|
    sum_a, sum_b = nums[0...idx].sum, nums[idx+1..].sum
    return idx if sum_a == sum_b
  end

  -1
end


## examples ##

p find_even_index([20, 10, -80, 10, 10, 15, 35])       #
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



## algorithm ##
# Initialize a local var _sums_ to an empty Array object


# Initialize a local var middlesums_index to an empty Hash object
# Iterate over input array (nums), with the index position available - 
#   > create a 2 item array containing the sums of elements to the left of the current item, and the right
#   > add that array to middlesums_index as a value for the key = the current iteration element, if the elements are equal
# Remove any subarrays whose elements are not equal ( |a, b| a != b ) 
# 