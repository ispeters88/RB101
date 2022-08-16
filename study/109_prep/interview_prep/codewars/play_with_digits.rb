# Playing with digits
# 
# Some numbers have funny properties. For example:
# 
# 89 --> 8¹ + 9² = 89 * 1
# 
# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
# 
# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
# 
# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
# 
# we want to find a positive integer k, if it exists, such that the sum of the digits of n 
# taken to the successive powers of p is equal to k * n.
# In other words:
# 
# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
# 
# If it is the case we will return k, if not return -1.
# 
# Note: n and p will always be given as strictly positive integers.


## problem ##
# input - two integers - n and p
# output - one integre
# goal - find a value k such that the result of k * n (1st argument) is equal to the sum of successive powers of the 
#        digits of n. If no such k exists, return -1
# rules
#   


def dig_pow(n, p)
  sum = 0
  n.digits.reverse.each_with_index do |digit, idx|
    sum += digit.pow(p+idx)
  end

  k = sum / n
  k * n == sum ? k : -1
end


## examples ##
p dig_pow(89, 1)#, 1)
p dig_pow(92, 1)#, -1)
p dig_pow(46288, 3)#, 51)

## algorithm ##
# Assume that a value k exists that satisfies the problem statement. Calculate the sum of the successive exponents of the 
# digits of n via:
#   > Create an array of the digits of n, in the order they appear in the number
#   > set a local variable sum to 0
#   > Iterate over the digit array. On each iteration:
#       > Calculate the result of raising the current digit to the power (p + index position)
#       > Add that result to the sum value
#   > Calculate k by dividing sum by n. If k is a positive integer, return it.
#   > Otherwise, return -1