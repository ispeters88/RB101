# Are they the "same"?
# * 10:03 *
# Given two arrays a and b write a function comp(a, b) (or compSame(a, b)) that checks whether the two arrays 
# have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). 
# "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

# The two arrays have the same size (> 0) given as parameter in function comp.

## problem ##
# input - two arrays, a and b
# output - boolean
# rules/reqs - 
#   1) return true if
#       1a) a and b have same size
#       1b) each ele in a maps to an element in b equal to ele_a ** 2 = ele_b
#   2) else return false

def comp(arr1, arr2)
  arr1.sort.map { |num| num ** 2 } == arr2.sort rescue false
end


## examples ##
p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
        [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])

## algorithm ##
# Transform the values in the first input array by squaring them
# Sort that result and the second input array
# Check the sorted and transformed 1st array and the sorted 2nd array for equality; return true if equal, false otherwise