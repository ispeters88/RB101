# Convert a String to a Signed Number!

=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers. 
In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. 
The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; 
if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. 
You may, however, use the string_to_integer method from the previous lesson.

=end

def string_to_integer(str_arr)
  places = str_arr.size - 1
  int = 0
  digit_counter = 0
  str_arr.each do |char|
    digit = (char.ord - 48)
    int += digit * 10 ** (places - digit_counter)
    digit_counter += 1
  end
  int
end

def string_to_signed_integer(str)
  str_arr = str.chars
  sign = str_arr.shift if ['+', '-'].include?(str_arr[0])
  int = string_to_integer(str_arr)
  sign == '-' ? int * -1 : int
end

## Examples ##

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100


## Data/Algorithm ##
# > Given a string, str - 
#     1) Convert str into an array
#     2) Check the first character. If it is a + or - character, strip that character and assign it to a variable, sign
#     3) Send the array into the string_to_integer method (developed in problem #7). An int is returned
#     4) If the sign variable = '-', multiply int by -1


## Further Exploration ##

def string_to_signed_integer_further(string)
  int = string_to_integer(string)
  int_strip_sign = string_to_integer(string[1..-1])
  case string[0]
  when '-' then -int_strip_sign
  when '+' then int_strip_sign
  else          int
  end
end