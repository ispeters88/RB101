# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

## Answer ##
# >> Mutating an arry while we are iterating over it can cause unexpected and undesirable results. This approach
# should be avoided

# The code above will output 
# 1
# 3

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# The code above will output
# 1
# 2