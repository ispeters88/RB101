# Find the odd int

# Given an array of integers, find the one that appears an odd number of times.
# 
# There will always be only one integer that appears an odd number of times.

## Problem ##
# input - array
# output - integer
# rules/reqs
#   1) the input array will contain only one integer that appears an odd number of times
#       > not clear from problem statement, but will assume this means "one and only one" (see questions, below)
#   2) return this integer value
# questions 
#   1) can the input array be empty? Implicitly based on examples, no. Will assume the input array is non empty for my solution

def find_it_slow(seq)
  seq.uniq.each do |num|
    return num if seq.count(num).odd?
  end
end

def find_it_hash(seq)
  counts = Hash.new(0)
  seq.each { |num| counts[num] += 1 }
  counts.keep_if { |_, count| count.odd? }.keys.first
end

## super condensed alternative ##
def find_it_elegant(seq)
  seq.inject(:^)
end


## Examples ##
p find_it_elegant([7])# should return 7, because it occurs 1 time (which is odd).
p find_it_elegant([0])# should return 0, because it occurs 1 time (which is odd).
p find_it_elegant([1,1,2])# should return 2, because it occurs 1 time (which is odd).
p find_it_elegant([0,1,0,1,0])# should return 0, because it occurs 3 times (which is odd).
p find_it_elegant([1,2,2,3,3,3,4,3,3,3,2,2,1])# should return 4, because it appears 1 time (which is odd).


## Data/Algorithm ##
# > Given an array, arr - 
#     1) create a separate array containing the unique values from find_it
#     2) iterate over the new array from step #1 and get the count of each value within the input array (arr)
#     3) as soon as a value is found with arr.count == 1, return that value

# using a hash structure to iterate once over the input array, rather than #count which in the worst case 
# results in us iterating over the array n times, where n is the size of the array.

# > Given an array, arr -
#     1) initialize a local variable counts, pointing to a Hash object, with a default value of 0
#     2) iterate over arr; on each iteration:
#         > add 1 to the value within counts for the key equal to the current iteration value
#     3) locate the odd value in counts and return its key
