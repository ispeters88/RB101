# Clean up the words


# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
# (the result should never have consecutive spaces).

def cleanup(string)
  alpha_chars = /[a-z]/
  clean_vals = string.chars.map { |char| alpha_chars.match?(char) ? char : ' ' }
  clean_vals.join.squeeze(' ')
end


### Notes
# > got a bit stuck on this one - specifically, the reducing consecutive ' ' characters down to 1. 
# Finally found the String#squeeze method which performs this exact function. 
# One of LS solutions iterates over the string and appends the alpha and ' ' characters to an array, using the Array#last 
# method to ensure that we don't append an ' ' if the last character we appended was also an ' '. ie.: 

def cleanup_via_arr(string)
  alpha_chars = /[a-z]/
  clean_chars = Array.new(0)
  string.chars.each do |char|
    if alpha_chars.match?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join
end


## second note - in the above solution, LS initializes a constant array, ALPHABET, via
ALPHABET = (a..z).to_a

## Problem ##
# input - string
# output - string
# reqs/rules
#   1) input string is lowercased, containing words with some number of non-alpha characters. 
#   2) output string should contain all same alpha characters as input, but substitute a space character for any non-alpha
#       characters from the original
#   3) if there is more than 1 consecutive non-alpha character, replace with just 1 space
# questions
#   1) are we returning a new string object, or the same one?


## Example ##
p cleanup_via_arr("---what's my +*& line?") #== ' what s my line '


## Data/Algorithm ##
# > Given a string, str - 
#     1) Initialize new blank string
#     2) Iterate over characters in str:
#         2a) if character is alphabetic, add it to new_str
#         2b) if character is non-alphabetic, start loop:
#             2b.1) if next character is also non-alphabetic, repeat this step, until
#             2b.2) next character is alphabetic, stop loop, and add space character to new_str