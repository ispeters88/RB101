# Reverse It (Part 2)

# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present.

def reverse_words_og(str)
  words_reversed = str.split.map! { |word| word.size > 4 ? word.reverse! : word }
  words_reversed.join(' ')
end

# note - #map is best suited to a transformation of all elements in a collection. 
# here we are transforming some but not all, based on a condition. #each may make more sense

def reverse_words(str)
  words = Array.new(0)
  str.split.each do |word|
    word.reverse! if word.size > 4
    words << word
  end
  words.join(' ')
end

## Problem ##
# input - string, one or more words
# output - new string
# requirements 
#   1) new string should contain all the same words, but an with 5+ characters should be reversed
# questions
#   1) can we define a "word" the typical way - delimited by white space?
#   2) might we have punctuation, and if so, what should we do with it?

## Examples ##

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('Spaces ')

# The tests above should print true.

## Data/Algorithm ##
# String containing 0 or more words. Can be nil string or arbitrary amount of white space
# > Given a string str - 
#     1) Create an array of the words in str
#     2) Iterate over the words in the array, and reverse any that are 5+ characters
#     3) Join the elements in the array from steps #1-2 into a new string
#     4) Return the new string