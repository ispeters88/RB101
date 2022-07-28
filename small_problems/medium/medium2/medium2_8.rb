# Next Featured Number Higher than a Given Value

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, 
# and whose digits occur exactly once each. 
# So, for example, 49 is a featured number, but 98 is not (it is not odd), 
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
# 
# Write a method that takes a single integer as an argument, 
# and returns the next featured number that is greater than the argument. 
# Return an error message if there is no next featured number.

## Problem ##
# input - integer
# output - integer
# rules/reqs
#   1) return the next "featured number" (see definition below) following the input number
#   2) "featured number" defined as follows:
#       > number is odd
#       > number is a multiple of 7
#       > no repeating digits (i.e. each digit only appears once in the number)

MAX_NO_REPEATS = 987654321

def feature?(n)
  digits = n.digits
  n.odd? && n % 7 == 0 && digits == digits.uniq
end

def featured(n)
  loop do
    n += 1
    return n if feature?(n)
    break if n > MAX_NO_REPEATS
  end
  "There is no possible number that fulfills those requirements"
end


## Examples ##
p featured(12)# == 21
p featured(20)# == 21
p featured(21)# == 35
p featured(997)# == 1029
p featured(1029)# == 1043
p featured(999_999)# == 1_023_547
p featured(999_999_987)# == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


## Data/Algorithm ##
# > Given an integer, n - 
#     1) count up from n
#     2) on each iteration, check if the current number is a featured number
#         > if it is, return it. Otherwise, continue to next iter
#     3) 