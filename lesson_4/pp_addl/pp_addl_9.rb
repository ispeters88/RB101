# As we have seen previously we can use some built-in string methods to change the case of a string. 
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize. 
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. 
# For example, the string:

# words = "the flintstones rock"

# would be:

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.


## Solution ##

def my_titleize(str)
  words = str.split
  words.each { |word| word.capitalize! }
  words.join(' ')
end


## LS supplied solution is much neater:

def LS_titleize(str)
  words.split.map { |word| word.capitalize }.join(' ')
end

## Problem ##
# input - string
# output - string
# requirements - output string should have each capitalized "as it would be in a title"
# questions
#   1) should the output be the same (mutated) string object, or a new string object?
#   2) should articles/conjunctions be capitalized when they are not the first word in the title?
#     i.e. words = "the flintstones rock the casbah" > "The Flintstones Rock the Cashbah" or "The Flintstones Rock The Casbah"
#   3) can any letters be capitalized in the original string - including those in the middle of words? 

## Examples ##

title = "the flintstones rock"
title_2 = "rock the Casbah"
title_3 = "All Words Are Already Capitalized"
title_4 = "whaT iF the WorDs Were WeIrD"

test1 = my_titleize(title) == "The Flintstones Rock"
test2 = my_titleize(title_2) == "Rock The Casbah"
test3 = my_titleize(title_3) == "All Words Are Already Capitalized"
test4 = my_titleize(title_4) == "What If The Words Were Weird"

puts test1
puts test2
puts test3
puts test4

##          ##

# note - my solution will assume that we are requested to return a new string, and that we should capitalize every word, 
# including articles and conjunctions

## Data structures ##
# > One string for input, separate string for output
## Algorithm ##
# > Given a string, str - 
#     Create an array of words in str by splitting off white space
#     Iterate over the array, and capitalize the first letter of the word (mutate the array)
#     Join the mutated words into a new string
#     Return the new string