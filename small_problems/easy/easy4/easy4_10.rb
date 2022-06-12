# Convert a Signed Number to a String!

=begin

In the previous exercise, you developed a method that converts non-negative numbers to strings. 
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. 
You may, however, use integer_to_string from the previous exercise.

=end

def integer_to_string(int)
  int.digits.reverse.join
end

#### Syntax for ternary operator with > 2 conditions ####

def signed_integer_to_string(num)
  num < 0 ? integer_to_string(-num).prepend('-') : num > 0 ? integer_to_string(num).prepend('+') : '0'
end



## Examples ##
p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'