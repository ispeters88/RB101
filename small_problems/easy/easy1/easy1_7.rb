# Stringy Strings

# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
# always starting with 1. The length of the string should match the given integer.

def stringy(number)
  (1..number).to_a.map! { |num| num % 2 == 0 ? '0' : '1' }.join
end


def stringy_further(number, rev_flag = 1)
  num_arr = Array.new(0)
  number.times do |index|
    number = rev_flag == 1 ? (index.even? ?  '1' : '0') : (index.even? ? '0' : '1')
    num_arr << number
  end
  num_arr.join
end


def stringy_further_2(number, rev_flag = 1)
  range = rev_flag == 1 ? (1..number) : (0...number)
  range.to_a.map! { |num| num.even? ? '0' : '1'}.join
end

## Problem ##
# input - integer (> 0)
# output - string
# requirements - 
#   1) output string should contain alternating 1s and 0s (starting with 1)
#   2) should have a total number of characters equal to the input integer
# questions
#   1) can we assume we will receive a valid integer value?


## Examples ##

puts stringy_further_2(6, 0) #== '101010'
puts stringy_further_2(9) #== '101010101'
puts stringy_further_2(4, 0) #== '0101' # true
puts stringy(7) #== '1010101'

## Data/Algorithm ##
# > Given an integer, number - 
#     1) Create an array using the range (1..number) and loop over the items
#     2) If the current value is odd, change it to '1'. Otherwise, change it to '0'
#     3) Join the array to a string
#     4) Return the string