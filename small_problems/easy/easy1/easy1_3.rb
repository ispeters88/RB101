# List of Digits

# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list_long(number)
  digits = Array.new(0)
  loop do
    digits << number % 10
    number /= 10
    break if number == 0
  end
  digits.reverse!
end

p digit_list_long(12345)

def digit_list(number)
  number.to_s.chars.map { |char| char.to_i }
end

## Note ##
# Idiomatic solution suggested by LS:

def digit_list_sugar(number)
  number.to_s.chars.map {&:to_i}
end


## Problem ##
# input - positive integer n
# output - list of digits in n
# requirements
#   1) input integer must be positive
# questions
#   1) the requested output form is "list". Can we assume we should be returning an array?
#       * will assume Yes for my solution
#   2) should we assume the order of the digits in the returned list should be the same as in n?
#       * will assume Yes for my solution

## Examples ##

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

## Data/Algorithm ##
# Integer - positive only (> 0)
## Long method algorithm ##
# > Given a positive integer n - 
#     1) Intialize a digit counter, set to 1
#     2) Initialize an empty array, digits
#     3) Iterate over each digit in n, starting right to left
#     4) Calculate the modulo of n by (10 * digit counter). Add this value to the digits array
#     5) Divide n by 10 and set n to the result
#     6) Repeat steps 4 and 5
#         * Break out of loop when n == 0
#     7) Reverse the order of the digits array
#     8) Return the digits array