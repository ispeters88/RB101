# Multiplying Two Numbers

# Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(first, second)
  first * second
end

## Example ## 
multiply(5, 3) == 15

# Further exploration

puts multiply([2, 4], 3)

# multiplying an array by a number n will return a new array with the elements in the original array repeated n times
#   > [2, 4, 2, 4, 2, 4]