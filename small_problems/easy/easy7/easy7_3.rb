# Capitalize Words

# Write a method that takes a single String argument and 
# returns a new string that contains the original value of the argument 
# with the first character of every word capitalized and all other letters lowercase.
# 
# You may assume that words are any sequence of non-blank characters.

## Problem ##
# input - string
# output - new string
# rules/reqs
#   1) output string should have the same characters as the input string, but with first letter of each "word" capitalized
#   2) word is a sequence of non-blank characters

def word_cap(text)
  text.split.map(&:capitalize).join(' ')
end

## Examples ##
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


## Data/Algorithm ##
# > Given a string, text - 
#     1) split text into array of substrings, using blanks/whitespace as split delimiter
#     2) iterate over substring array, capitalizing (mutatively) the first letter of each substring
#     3) join substring array into new string and return that string

## Further Exploration ##
# Ruby conveniently provides the String#capitalize method to capitalize strings. 
# Without that method, how would you solve this problem? Try to come up with at least two solutions.

def word_cap_fe1(text)
  text.split.each do |word|
    word[0] = word[0].upcase
  end.join(' ')
end

p word_cap_fe1('four score and seven')# == 'Four Score And Seven'
p word_cap_fe1('the javaScript language')# == 'The Javascript Language'
p word_cap_fe1('this is a "quoted" word')# == 'This Is A "quoted" Word'

def word_cap_fe2(text)
  text.split.map do |word|
    word[0].upcase + word[1..].downcase
  end.join(' ')
end

p word_cap_fe2('four score and seven') == 'Four Score And Seven'
p word_cap_fe2('the javaScript language') == 'The Javascript Language'
p word_cap_fe2('this is a "quoted" word') == 'This Is A "quoted" Word'