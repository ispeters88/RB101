# Swap Case

# Write a method that takes a string as an argument 
# and returns a new string in which every uppercase letter is replaced by its lowercase version, 
# and every lowercase letter by its uppercase version. All other characters should be unchanged.
# 
# You may not use String#swapcase; write your own version of this method.

## Problem ##
# input - string
# output - string
# rules/reqs
#     1) return value should be a new string object
#`    2) return string should have same characters as original string, except
#         2a) uppercase letter characters switched to lowercase
#         2b) lowercase letter characters switched to uppercase
# questions

LETTERS = /[A-Za-z]/

def change_case(char)
  char.downcase == char ? char.upcase : char.downcase
end

def swapcase(str)
  str.chars.map do |char|
    char.match?(LETTERS) ? change_case(char) : char
  end.join
end


## Examples ##
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

## Data/Algorithm ##
# > Given a string, str - 
#     1) Iterate over the characters in the string
#     2) On each iteration, check if the character is a letter
#     3) If it is, swap its case (uppercase to lowercase, and vice versa) and add to result string
#     4) If not, add to result string
#     5) return the result string


def swapcase_one_method(str)
  str.chars.map do |char|
    if char.match?(LETTERS)
      char.downcase == char ? char.upcase : char.downcase 
    else
      char
    end
  end.join
end

def swapcase_short(str)
  str.chars.map { |char| char.match?(/[A-Z]/) ? char.downcase : char.upcase }.join
end

p swapcase_short('CamelCase') == 'cAMELcASE'
p swapcase_short('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'