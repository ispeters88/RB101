# Reverse It (Part 1)

# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(str)
  str.split.reverse!.join(' ')
end


## Problem ##
# input - string
# output - new string
# requirements 
#   1) new string should contain all the same words but in reverse order
#   2) nil string should return nil string
#   3) whitespace only should return nil string
# questions
#   1) can we define a "word" the typical way - delimited by white space?
#   2) might we have punctuation, and if so, what should we do with it?

## Examples ##

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# The tests above should print true.

## Data/Algorithm ##
# String containing 0 or more words. Can be nil string or arbitrary amount of white space
# > Given a string str - 
#     1) Create an array of the words in str
#     2) reverse the order of the array (mutate it)
#     3) Join the elements in the array from steps #1-2 into a new string
#     4) Return the new string