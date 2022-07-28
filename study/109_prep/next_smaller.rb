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
  digs = n.digits.reverse
  size = digs.size
  idx = -2
  binding.pry

  loop do
    if digs[idx + 1..].any? { |num| num < digs[idx] }
      swap_vals = Hash.new
      digs[idx + 1..].each_with_index { |num, i| swap_vals[num] = i if num < digs[idx] }
      move, move_to = swap_vals.max
      tmp = digs[idx]
      digs[idx] = digs[move_to]
      digs[move_to] = tmp
      digs[0..move_to] + digs[move_to + 1..].sort { |a, b| b <=> a }
    end
    idx -= 1
    break if idx == -size - 1
  end
end

## examples ##
p next_smaller(315)         # => 153

# p next_smaller(907)         #  => 790
# p next_smaller(531)         # => 513
# p next_smaller(135)         # => -1
# p next_smaller(2071)        # => 2017
# p next_smaller(414)         # => 144
# p next_smaller(123456798)         # => 123456789
# p next_smaller(123456789)         # => -1
# p next_smaller(1234567908)        # => 1234567890

## algorithm ##

# iterate over the digits of n, in reverse
#     > if there are no digits @ higher index position than current value that are smaller, skip to next iteration
#     > otherwise take max value of all values w/ higher index position that are smaller than current value
#     > switch current value and found value (if any)
#     > sort all values at higher index position than found value in descending order


# brute force #
# get every possible ordering of digits
#   > convert n to array
#   > get all possible permutations of array values
#   > join the permutation values into strings. map into integers
#   > remove any values that are >= n
# find maximum value between the remaining values