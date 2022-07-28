# is my friend cheating?

# A friend of mine takes the sequence of all numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (n is always strictly greater than 0) and returns an array or a string 
# (depending on the language) of the form:
# 
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.
# 
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ... will be sorted in increasing order of the "a".
# 
# It happens that there are several possible (a, b). The function returns an empty array (or an empty string) 
# if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).


## Problem ##
# input - integer, n
# output - array
# rules/reqs
#   1) input value n is always > 0
#   2) output value is a 2d nested array, containing all (a,b) combinations such that, 
#      when the sequence 1 - n is summed, excluding a and b, that sum equals a * b
#   3) there can be 0, 1, or more such combinations of a and b. If there are 0, return nil
# questions


def removNb(n)
  result = Array.new
  total = n * (n + 1) / 2

  (1..n).to_a.combination(2).each do |a, b|
    if a * b == (total - a - b)
      [a, b].permutation.each { |npr| result << npr }
    end
  end
  result.empty? ? nil : result
end

def removNb_v2(n)
  result = Array.new
  total = n * (n + 1) / 2

  (1..n).to_a.combination(2).each do |a, b|
    [a, b].permutation.each { |npr| result << npr } if a * b == (total - a - b)
  end
  result.empty? ? nil : result
end


## Examples ##
p removNb(26)#  should return [(15, 21), (21, 15)]
# or
removNb(26)#  should return { {15, 21}, {21, 15} }
# or
removNb(26)#  should return [[15, 21], [21, 15]]
# or
removNb(26)#  should return [ {15, 21}, {21, 15} ]
# or
removNb(26)#  should return "15 21, 21 15"


## Data/Algorithm ##
# > Given a positive integer, n - 
#     1) initialize a local variable, result, pointing to an empty array object
#     2) calculate the sum of all integers in the sequence 1 - n, and assign that value to a local variable seq_total
#     3) find all two-item permutations of the values in the sequence 1 - n. 
#     4) Iterate over those combinations; on each iteration:
#         > compare the product of the two values against the value of total - the sum of the two values
#         > if the two resulting values above are equal, add an array containing the two values to result
#     5) If result has no elements, return nil; otherwise, return result


# Optimized version #
# > my original solution used a full nested loop so -> O(n^2). It is timing out on the last test example which is presumably
# a very high number
# > Theory: perhaps we can get this to O(n*log(n)) by using a nested loop but applying binary search within the inner loop -?

# here is an attempt at that:

# > Given a positive integer, n -
#   1) initialize a local variable, result, pointing to an empty array object
#   2) calculate the sum of all integers in the sequence 1 - n, and assign that value to a local variable seq_total
#   3) set up outer iteration, over all values between 1 and n; on each iteration, with iter number i : 
#         > Set up inner iteration. Should be between values i and n


def removNb_opt(n)
  result = Array.new
  total = n * (n + 1) / 2

  (1..n).each do |b|
    a = (total - b) / (b + 1).to_f
    result << [a.to_i, b] if a < n && a.to_i == a
  end

  result.sort
end

p removNb_opt(26)
#p removNb_opt(1000000000000000000)


=begin
# some observations via maths:


a * b = n * (n + 1) / 2 - a - b

a * b + a = (n * (n + 1) / 2) - b

a * (b + 1) = (n * (n + 1) / 2) - b

a = ((n * (n + 1) / 2) - b) / (b + 1)


n * (n + 1) / 2 = a * b + a + b

(n * (n + 1) / 2) - b = a * b + a

(n * (n + 1) / 2) - b = a * (b + 1)

((n * (n + 1) / 2) - b) / (b + 1) = a
=end