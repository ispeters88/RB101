# Convert a String to a Number!

=begin
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. 
String#to_i and the Integer constructor (Integer()) behave similarly. 
In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. 
You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; 
assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, 
such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and 
calculate the result by analyzing the characters in the string.
=end


# idea 1: make a hash containing all 10 digits in both string and numeric form
# idea 2: use ascii values
##    **The string version of each digit has ascii value == digit_ascii_value + 48

def string_to_integer(str)
  places = str.length - 1
  int = 0
  digit_counter = 0
  str.chars.each do |char|
    digit = (char.ord - 48)
    int += digit * 10 ** (places - digit_counter)
    digit_counter += 1
  end
  int
end


## Examples ##

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


## Further Exploration ##

# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

def hexadecimal_to_integer (hex_str)
  places = hex_str.length - 1
  int = 0
  digit_counter = 0
  hex_str.chars.each do |char|
    int += char.hex.ord * 16 ** (places - digit_counter)
    digit_counter += 1
  end
  int
end

p hexadecimal_to_integer('4D9f') #== 19871