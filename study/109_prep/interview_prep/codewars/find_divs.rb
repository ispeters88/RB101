# Find the divisors!

# Create a function named divisors/Divisors that takes an integer n > 1 and 
# returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. 
# If the number is prime return the string '(integer) is prime' (null in C#) 
# (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).

## Problem ##
# input - integer (n)
# output - array or string (see rules below)
# rules/reqs
#   1) input integer is strictly > 1
#   2) output type is dependent on whether input integer is prime:
#       > if not prime, output array containing all divisors of n. Don't include 1 or n
#       > if prime, output string: "#{n} is prime"
#   

def get_divs(n)
  divs = Array.new

  2.upto(n - 1) do |num|
    divs << num if n % num == 0
  end

  divs
end

def divisors(n)
  divs = get_divs(n)
  divs.empty? ? "#{n} is prime" : divs
end

## Examples ##
p divisors(12) # should return [2,3,4,6]
p divisors(25) # should return [5]
p divisors(13) # should return "13 is prime"


## Algorithm ##
# > Given an integer n -
# Iterate over the integers between 2 and n - 1 (inclusive). 
# For each value, determine if it is a divisor of n. If so, add it to a results array.
# Check the size of the results array. If it is empty, return the string "#{n} is prime". Otherwise, return the results array

# low level alg for iteration (get_divs method)
# 1) start at 2, end at n - 1
# 2) on each iteration, check if the current value divides evenly into n (i.e. divides with remainder = 0)
# 3) if so, add to our results array