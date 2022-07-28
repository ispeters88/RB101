# Distinct Digit Year

# Task
# The year of 2013 is the first year after the old 1987 with only distinct digits.
# 
# Now your task is to solve the following problem: given a year number, 
# find the minimum year number which is strictly larger than the given one and has only distinct digits.
# 
# Input/Output
# [input] integer year
# 1000 ≤ year ≤ 9000
# 
# [output] an integer
# the minimum year number that is strictly larger than the input number year and all its digits are distinct.


## Problem ##
# input - integer
# output - integer
# rules/reqs
#   1) the output value is the first year found with distinct digits, which is strictly larger than the input value
#   2) the input value will be between 1000 and 9000, inclusive

require "pry-byebug"

def distinct_digit_year(year)
  loop do
    year += 1
    dig_array = year.digits
    return year if dig_array.uniq.size == dig_array.size
  end
end


## Examples ##
p distinct_digit_year(1987) # == 2013
p distinct_digit_year(2013) # == 2014
p distinct_digit_year(2229) # == 2301


## Algorithm ##

# Count up from the input value (year), checking the digits of each number to see if they are all different.
# Return the first where this is true

# 1) Iterate starting at year + 1; on each iteration:
#     > Check if the digits of the current value are all different. If they are, stop and return that value

# Checking if digits are all different
# 1) add each digit to an array
# 2) check if the list of unique elements in the array has size equal to the total number of elements in the array
