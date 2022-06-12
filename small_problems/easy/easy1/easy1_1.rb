# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer, 
# and prints the string as many times as the integer indicates.

def repeat(str, n)
  n.times { puts str }
end

def repeat_v2(str, n)
  (1..n).each { puts str }
end

def repeat_v3(str, n)
  counter = 0
  loop do
    puts str
    counter += 1
    break if counter == n
  end
end

## Problem ##
# input - 1) string str, 2) positive integer n
# output - output str to console, n times
# requirements
# questions
#   1) should we prints or puts? will assume puts in solution

## Examples ##

repeat('Hello', 3)
repeat_v2('Hello Version 2', 3)
repeat_v3('Hello Version 3', 3)

# output:
# Hello
# Hello
# Hello

## Data/Algorithm ##
# String
# Integer (> 0)
#   Given a string str, and an integer n - 
#     1) Iterate from 1 through n
#     2) On each iteration, output str to the console (use puts rather than print)