# Next smaller number with the same digits

# Write a function that takes a positive integer and returns the next smaller positive integer containing the same digits.
# Return -1 (for Haskell: return Nothing, for Rust: return None), when there is no smaller number that contains the same digits. 
# Also return -1 when the next smaller number with the same digits would require the leading digit to be zero.


## problem ##
# input - integer, n
# output - integer
# rules/reqs
#   1) output value should be the largest possible integer x, such that x is < n, and x contains same digits as
#      n (in different order)

def next_smaller_brute(n)
  digit_combos = n.digits.permutation(n.digits.size).map(&:join).map(&:to_i)
  digit_combos.delete_if { |num| num >= n }
  digit_combos.empty? ? -1 : digit_combos.max
end

require "pry-byebug"

def resort_digits(digits)
  # mutates passed in array

end


def next_smaller(n)
  digits = n.digits
  places = digits.size
  new_digits = Array.new

  #binding.pry
  (0...places).each do |i|
    maybe_swap_index = digits.find_index { |num| num > i }
    next unless maybe_swap_index
    old_val = digits[i]
    new_val = digits[maybe_swap_index]
    digits[i] = new_val
    digits[maybe_swap_index] = old_val
    return digits.reverse
  end

  #digits.reverse
end

## examples ##
#p next_smaller(315)         # => 153
#
#p next_smaller(907)         #  => 790
p next_smaller(531)         # => 513
p next_smaller(135)         # => -1
p next_smaller(2071)        # => 2017
p next_smaller(7021)
p next_smaller(414)         # => 144
p next_smaller(123456798)         # => 123456789
p next_smaller(123456789)         # => -1
p next_smaller(1234567908)        # => 1234567890

p next_smaller(5351)

## algorithm ##


# initialize a local var new_digits to an empty Array object
# iterate over the digits of the input number, in reverse (starting at last index position)
#   > look for the first possible value that is greater than the current iteration value
#   > if none exists, move to the next element and continue
#   > if one exists, "swap" the two values, then - 
#       > take the remaining values and sort them



# iterate over the digits of n, in reverse
#     > if there are no digits @ higher index position than current value that are bigger, skip to next iteration
#     > otherwise take min value of all values w/ higher index position that are bigger than current value
#     > switch current value and found value (if any)
#     > sort all values at higher index position than current iteration position, in descending order


# brute force #
# get every possible ordering of digits
#   > convert n to array
#   > get all possible permutations of array values
#   > join the permutation values into strings. map into integers
#   > remove any values that are >= n
# find maximum value between the remaining values