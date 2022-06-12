# Palindromic Strings (Part 1)

# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.


def is_palindrome?(str)
  str == str.reverse
end

## Problem ##
# input - string
# output - boolean
# requirements/rules
#   1) determine if input string is a palindrome
#   2) return true if it is, false otherwise
#   3) palindrome -> same backwards and forwards
#     3a) case sensitive
#     3b) punctuation and spaces "matter"
# questions


## Examples ##
p is_palindrome?('madam') # == true
p is_palindrome?('Madam') #== false          # (case matters)
p is_palindrome?("madam i'm adam") #== false # (all characters matter)
p is_palindrome?('356653') #== true


## Data/Algorithm ##
# > Given a string, str - 
#     1) check if str is a palindrome
#     2) return true if it is, false otherwise
# > Given an array, arr - 
#     1) 


## Further Exploration ##

# 1) Write a method that determines whether an array is palindromic; 
#    that is, the element values appear in the same sequence both forwards and backwards in the array. 
# 2) Now write a method that determines whether an array or a string is palindromic; 
#    that is, write a method that can take either an array or a string argument, 
#    and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.


def arr_is_palindrome?(arr)
  arr == arr.reverse
end

def flexible_is_palindrome?(letters)
  letters == letters.reverse
end