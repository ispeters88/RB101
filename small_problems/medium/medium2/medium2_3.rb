# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, 
# as well as characters that were neither of those two. Now we want to go one step further.
# 
# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the percentage of characters in the string that are lowercase letters, 
# one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
# 
# You may assume that the string will always contain at least one character.


## Problem ##
# input - string
# output - hash
# rules/reqs
#   1) output hash should contain 3 key/value pairs
#       lowercase: percentage
#       uppercase: percentage
#       neither: percentage
#   2) whitespace should be considered; they count as "neither"

LOWER = /[a-z]/
UPPER = /[A-Z]/
NEITHER = /[^a-zA-Z]/

require "pry-byebug"

def letter_percentages(str)
  total = str.length.to_f
  chars = str.chars
  {lowercase: (chars.count { |char| char.match?(LOWER) } / total * 100.0).round(1),
   uppercase: (chars.count { |char| char.match?(UPPER) } / total * 100.0).round(1),
   neither: (chars.count { |char| char.match?(NEITHER) } / total * 100.0).round(1) }
end



## Examples ##
p letter_percentages('abCdef 123')# == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef')# == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123')# == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')


## Data/Algorothm ##
# > Given a string, str - 
#     1) Get the length of the string
#     2) Create a hash
#     3) add the lowercase/uppercase/neither keys to the hash with values based on
#         > the count of each category, divided by the length of the string