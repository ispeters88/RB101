# Delete vowels


# Write a method that takes an array of strings, 
# and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed

## Problem ##
# input: array (containing strings)
# output: array with corresponding string values after removal of vowels
# questions
#   1) Should we return a mutated version of the original array, or should we return a new array
#       > in lieu of clarity, I will assume a new array is to be returned
require "pry-byebug"

VOWELS = /[aeiouAEIOU]/

def remove_vowels(string_arr)
  vowel_less_strings = Array.new
  string_arr.map { |string| vowel_less_strings << string.gsub(VOWELS, '') }
  vowel_less_strings
end


## Examples ##
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

## Data/Algorithm ##
# > set up a constant containing the vowels
# > iterate over array
#   >> turn each string into an array. iterate over that array and delete any chars that match the VOWELS constant
# > return the new array

## Further Exploration ##

# I used a differnet approach than LS, so this FE is complete. Noting the LS solution (which is more elegant)
# for future reference

def remove_vowels_LS(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end