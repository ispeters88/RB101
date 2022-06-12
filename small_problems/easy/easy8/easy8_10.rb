# Get The Middle Character

# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. 
# If the argument has an odd length, you should return exactly one character. 
# If the argument has an even length, you should return exactly two characters.


## Problem ##
# input - string
# output - string
# rules/reqs
#   1) intput string is non-empty
#   2) output string should contain 1 character - the "middle character"
#   3) middle character is defined as:
#       3a) 1 character for odd length input strings, index = input string length / 2
#       3b) 2 characters for even length input strings, indices = input string length / 2 - 1, and input string length / 2


def center_of(string)
  size = string.size
  center = size / 2
  size.odd? ? string[center] : string[center - 1..center]
end


## Examples ##
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'