# Transform To Prime
# * 6:54 *
# Given a List [] of n integers , find minimum number to be inserted in a list, 
# so that sum of all elements of list should equal the closest prime number .
# 
# List size is at least 2 .
# 
# List's numbers will only positives (n > 0) .
# 
# Repetition of numbers in the list could occur .
# 
# The newer list's sum should equal the closest prime number .



## problem ##
# input -  array
# output - integer
# rules/reqs
#   1) input array has size >= 2
#   2) elements in input array are positive integers
#   3) repetition of elements is possible
#   4) sum of input array plus output integer equals the closest prime number to the sum of the input array

require "prime"

def transform_prime(array)
  input_sum = array.sum
  next_prime = input_sum

  loop do
    break if next_prime.prime?
    next_prime += 1
  end

   next_prime - input_sum
end


## examples ##
p transform_prime([3, 1, 2])      # 1
p transform_prime([1, 5, 8, 11])  # 4


## algorithm ##
# Calculate sum of input array
# Find the next prime number after that sum value
# Calculate the difference (prime number - array sum)
# Return this value