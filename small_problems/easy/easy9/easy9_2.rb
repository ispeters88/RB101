# Double Doubles

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# 
# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; 
# double numbers should be returned as-is.

def is_double_num?(num)
  num_string = num.to_s
  digits = num_string.length
  center = digits / 2
  digits.even? && num_string[0..center - 1] == num_string[center..]
end

def twice(num)
  is_double_num?(num) ? num : num * 2
end


## Examples ##

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10


## Data/Algorithm ##
# > Given a number, n - 
#   !) Determine if n is a "double number". If so, return it
#       1a) Number of digits in number has to be even, AND
#       1b) First "half" of number has to be equal to second "half"
#   2) Otherwise, multiple the number by 2 and return that value