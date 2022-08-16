# Multiples of 3 or 5
# *7:36*

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in. Additionally, if the number is negative, return 0 (for languages that do have them).

# Note: If the number is a multiple of both 3 and 5, only count it once.

## problem ##
# input - a number
# output - number
# rules/reqs
#   1) output is a sum of all values between 3 and input, that are a multiple of 3 or 5
#   2) if input value is negative, return 0

def multiples_3_5(n)
  sum = 0
  return 0 if n < 3
  (3..n - 1).each { |num| sum += num if num % 3 == 0 || num % 5 == 0 }
  sum
end

## examples ##

p multiples_3_5(10) #, 23)
p multiples_3_5(20) #, 78)
p multiples_3_5(200) #, 9168)


## algorithm ##
# we can think of being a multiple as the modulus expression for 3 or 5 being equal to 0:
#   x % 3 == 0 || x % 5 == 0


# For given input n - 
# Initialize a running counter variable, sum
# Construct an enumerable from the range 3 to n -1, then iterate over it
#   > on each iteration, if the current value is a multiple of 3 or 5, add its value to sum
# Return sum if positive, 0 if negative
