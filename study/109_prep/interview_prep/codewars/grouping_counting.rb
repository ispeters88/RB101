# Grouping and Counting
#  * 8:25 *
# Your goal is to write the group_and_count method, which should receive and array as unique parameter and return a hash. 
# Empty or nil input must return nil instead of a hash. 
# This hash returned must contain as keys the unique values of the array, and as values the counting of each value.
# 
# The following methods were disabled:
# 
# Array#count
# Array#length






## problem ##
# input - array
# output - hash
# rules/reqs
#   1) if input array is empty or input value is nil, return nil
#   2) output hash should contain
#       > keys - unique values from input array
#       > values - counts of each value
#   3) implicitly, array contains numbers. unclear if there may be test cases with other element types

def group_and_count(array)
  return nil if array.nil? || array.empty?
  array.each_with_object(Hash.new(0)) { |val, counts| counts[val] += 1 }
end

## examples ##
p group_and_count([0,1,1,0])
p group_and_count(nil)
p group_and_count([])


## algorithm ##
# Check if input array has size 0 or input is equal to nil; if so, return nil
# Initialize a local variable to an empty Hash object with default value 0
# Iterate over the values in the input array; increment the value in the hash for the key that is the current iteration element

