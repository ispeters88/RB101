# 3. (part 2)
# * 21:23 *
=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits. 

examples: 
12 --> 21 
513 --> 531
2017 --> 2071
If no bigger number can be formed using these digits, return -1. 
examples: 
9 --> -1
111 --> -1
531 --> -1 
p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798
=end


## problem ##
# input - integer
# output - integer
# rules/reqs
#   1) input Int is > 0
#   2) output value should be the next biggest number that can be formed from same digits, via rearrangement
#   3) if no such value exists, return -1

def next_bigger(num)
  digits = num.digits
  new_digits = Array.new
  i, k, num_length = 0, 0, digits.size

  digits.each_with_index do |num, i|
    digits[i+1..].each_with_index do |potential_swap, k|
      next if potential_swap >= num
      digits[i] = potential_swap
      digits[i + k + 1] = num
      return digits.reverse
    end
  end

  -1
end


## examples ##
p next_bigger(9)#  == -1
p next_bigger(12)#  == 21
p next_bigger(513)#  == 531
p next_bigger(2017)#  == 2071
p next_bigger(111)#  == -1
p next_bigger(531)#  == -1
p next_bigger(123456789)#  == 123456798

## algorithm ##
# Iterate over the digits in the input number, from right to left
#   > Iterate over the digits to the right of the current element
#       > if a digit is less than the current element, swap them
#       > if swap occurs, return the digits joined together in reverse order
# If iteration completes, return -1