# Find the unique number
# * 9:30 * 
# There is an array with some numbers. All numbers are equal except for one. Try to find it!
# 
# It’s guaranteed that array contains at least 3 numbers.
# 
# The tests contain some very huge arrays, so think about performance.


## problem ##
# input - array
# output - number
# rules/reqs
#   1) input array contains numbers - can be multiple types (ints, floats, etc)
#   2) output should be an element from the input array - the element should only appear once in the array
#   3) all other elements in the input array will be equal to each other except for the output number

def find_uniq(nums)
  counts = Hash.new(0)
  nums.each { |num| counts[num] += 1 }
  counts.select { |key, val| val == 1 }.keys.first
end


## examples ##
p find_uniq([1,1,1,1,0])# , 0)
p find_uniq([ 1, 1, 1, 2, 1, 1 ])# , 2);
p find_uniq([ 0, 0, 0.55, 0, 0 ])# , 0.55);


## algorithm ##
# Initialize a local var *counts* to an empty Hash object with default value 0
# Iterate over the input array
#   > Increment the value for the key equal to the current iteration element, by 1
# Return the key for the counts array for which the value = 1
