# Count Odd Numbers below n
# 
# Given a number n, return the number of positive odd numbers below n, EASY!


## Problem ##
# input - number, n
# output - number of positive odd numbers less than n
# rules/reqs
#   1) output should be a count of the number of positive odd numbers that are strictly less than n
# questions
#   1) can we assume the input value n is an integer? or could it be a rational or float?

def odd_count(n)
  n / 2
end

## Algorithm ##
# Count down from n; on each iteration, add 1 to a running total if the current value is positive and odd

#   1) initialize a local variable, count, and assign it to the Integer object 0
#   2) Iterate descendingly over the values from n to 0; on each iteration:
#         > check if the current value is positive and odd. If so, add 1 to count
#   3) return count 


## Examples ##
p odd_count(7) #== 3 #(because odd numbers below 7 are [1, 3, 5])
p odd_count(15) # == 7 #(because odd numbers below 15 are [1, 3, 5, 7, 9, 11, 13])
p odd_count(8) #== 4 #[1, 3, 5, 7]