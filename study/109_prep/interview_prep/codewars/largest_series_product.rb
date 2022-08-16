# Largest product in a series
# * 8:44 *

# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits 
# in the given string of digits.
# 
# The input string always has more than five digits.

# greatestProduct("123834539327238239583")


## problem ##
# input - string
# output - integer
# rules/reqs
#   1) input string will contain > 5 digit characters
#   2) output should be the product of 5 consecutive characters, such that the product is greater than
#      all other possible products of 5 consecutive chars


def greatest_product(num_string)
  fives = Array.new
  digits = num_string.chars.map { |char| char.to_i }

  0.upto(num_string.length - 5) do |idx|
    fives << digits[idx...idx+5]
  end
  fives.map { |five| five.inject(&:*) }.max
end


## examples ##
p greatest_product("123834539327238239583")      # 3240

p greatest_product("123834539327238239583")     #, 3240)
p greatest_product("395831238345393272382")     #, 3240)
p greatest_product("92494737828244222221111111532909999")     #, 5292)
p greatest_product("92494737828244222221111111532909999")     #, 5292)
p greatest_product("02494037820244202221011110532909999")     #, 0)

## algorithm ##
# Initializing a local var to an empty Array object - fives
# Iterate over the digits in the input string
#       > take slices of length five
#       > add each set of 5 digits to fives Array
# Calculate the product of each subarray in fives
# Return largest such value