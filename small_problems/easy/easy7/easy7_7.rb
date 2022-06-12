# Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all the numbers together, 
# divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. 
# Assume the array is non-empty.

## Problem ##
# input - array
# output - display float to console
# rules/reqs
#   1) input array contains integers
#   2) output float should be rounded to 3 decimal places
#   3) value of output is the combined product of the integers in the input array, divided by the number of such integers

def show_multiplicative_average(arr)
  result = sprintf("%.3f", arr.inject(&:*) / arr.size.to_f.round(3))
  puts "The result is #{result}"
end



## Examples ##
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


## Data/Algorithm ##
# > Given an array of integers, arr - 
#     1) Calculate the product of all the values in arr
#     2) Count the number of integerrs in arr
#     3) Divide the product from #1 by the count in #2. Round to 3 decimal places
#     4) return the value from #3


## Further Exploration ##
# What happens if you omit the call to #to_f on the first line of our method?
## >> The values get rounded down to whole integers


def show_multiplicative_average_ls(numbers)
  product = 1
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

## Examples ##
show_multiplicative_average_ls([3, 5])                # => The result is 7.500
show_multiplicative_average_ls([6])                   # => The result is 6.000
show_multiplicative_average_ls([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
