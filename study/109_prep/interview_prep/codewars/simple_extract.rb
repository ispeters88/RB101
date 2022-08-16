# Simple Simple Simple String Expansion


# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values # represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. # Empty strings should return an empty string.
# 
# The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next # numeric value appears.


## problem ##
# input - string
# output - 
# rules/reqs
#   1) input string contains only alphanumeric characters
#   2) output string should contain only alphabetic characters from input string, but repeated n times, where n is the 
#      last numeric value from the input string directly preceding the alphabetic character
#   3) if input is empty, output should be empty

require "pry-byebug"

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def string_expansion(str)
  str_expanded, tmp_expand = '', ''
  multiplier = 1
  
  str.chars.each do |char|
    if DIGITS.include?(char)
      multiplier = char.to_i
      str_expanded << tmp_expand
      tmp_expand = ''
    else
      tmp_expand << char * multiplier
    end
  end

  str_expanded << tmp_expand
end


## Examples ##


p string_expansion('3abc')# ,'aaabbbccc')
p string_expansion('3D2a5d2f')# ,'DDDaadddddff')
p string_expansion('0d0a0v0t0y')# ,'')
p string_expansion('3d332f2a')# ,'dddffaa')
p string_expansion('abcde')# ,'abcde')


## algorithm ##

# Initialize a variable to an empty string object, *str_expanded*
# Iterate over the characters in the input string. Anytime a number is encountered, set a variable *multiplier* to the number, initialize an empty string object tmp_expand, and continue iteration. Add any alphabetic characters found to tmp_expand, repeated *multiplier* times. 
# When the next numeric character is encountered, reset *multiplier* to that new number, add the current value of *tmp_expand* to *str_expanded*, then reset *tmp_expand* to ''
# When iteration is complete, return *str_expanded*