# Multiples of 3 or 5
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
# The sum of these multiples is 23.
# 
# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. 
# Additionally, if the number is negative, return 0 (for languages that do have them).
# 
# Note: If the number is a multiple of both 3 and 5, only count it once.


## Problem ##
# input - number
# output - number
# rules/reqs
#   1) input number can be any integer (+/-/0) - see assumption in questions section below
#   2) return value should be the sum of all the multiples of 3 or 5 that are strictly below the input value
#   3) if the input value is negative, return 0
#   4) multiple of 3 or 5 means -> the value evenly divides 3 and/or 5
#   5) if a value is a multiple of both 3 and 5, include it once in the sum to be returned
# questions
#   1) can we assume that input will be an integer?
#       > for my solution, I will assume this is the case      

=begin
def multiple_sum(n)
  return 0 if n < 3
  results = Array.new
  
  3.upto(n-1) do |num|
    results << num if num % 3 == 0 || num % 5 == 0
  end

  results.sum
end
=end

def multiple_sum(n)
  return 0 if n < 3
  (3...n).to_a.select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end


## Examples ##
p multiple_sum(-5)
p multiple_sum(0)
p multiple_sum(2)
p multiple_sum(10) # 23
p multiple_sum(20) # 78
p multiple_sum(200) # 9168


## Algorithm ##
# > Given an integer, n - 
# Check if the input is < 1; if so, return 0
# Otherwise, iterate from 3 to n - 1. Check each value for being a multiple of either 3 or 5. If it is, add it to a 
# results array
# After iteration is complete, return the sum of the results array


# 1) Initialize a local variable _results_ pointing to an empty Array object