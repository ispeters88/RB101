# Fibonacci Number Location By Length

=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, 
and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. 
For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- 
that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number 
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.


=end

## Problem ##
# input - integer
# output - integer
# rules/reqs - output integer should be the index in the Fibonacci sequence of the first value that has a number of digits
#             equal to the input integer
# questions

# observation - 
# 10 ** (n-1) has n digits

def find_fibonacci_index_by_length(num)
  fib_seq = [1, 1]
  while fib_seq.last < 10 ** (num - 1)
    fib_seq << fib_seq.last(2).inject(:+)
  end
  fib_seq.size
end


## Examples ##
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847


## Data/Algorithm ##
# > Given an integer n, which represents a number of digits - 
#     1) build the Fib sequence up until the point that a value in the sequence has n digits
#     2) return the index position of that value, in the fib sequence