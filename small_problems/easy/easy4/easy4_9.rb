# Convert a Number to a String!

=begin

In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. 
In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. 
Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

=end


def integer_to_string(int)
  str = ''
  int.digits.reverse.each do |digit|
    str << (digit + 48).chr
  end
  str
end

def integer_to_string_elegant(int)
  int.digits.reverse.join
end

## Examples ##
p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'


## Further Exploration ##

# 1) String methods without ! that are mutating
#     #clear
#     #concat
#     #replace
#     #insert
# 2) String methods with an ! that do not have a corresponding method without an !
#      I was unable to find any such methods
# 3) Array/Hash methods with an ! that do not have a corresponding method without an !
#     Array#sort_by! - note that the included file Enumerable has a #sort_by method, but no sort_by!
#     I was unable to find any such methods for Hash