# WeIrD StRiNg CaSe
# * 8:40 *
# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, 
# and returns the same string with all even indexed characters in each word upper cased, 
# and all odd indexed characters in each word lower cased. The indexing just explained is zero based, 
# so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.
# 
# The passed in string will only consist of alphabetical characters and spaces(' '). 
# Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').





## problem ##
# input - string
# output - string
# rules/reqs
#   1) PERHAPS - input string must be modified in place - output string should be same object
#   2) output string should have alternating characters uppercased/lowercased in each word
#       > with 0 as index position of first letter of each word, uppercase the even indexed characters (0, 2, etc)
#       > lowercase the odd indexed characters


def weirdcase(string)
  string.split.map do |word|
    word.chars.map.with_index do |char, idx|
      idx.even? ? char.upcase : char.downcase
    end.join
  end.join('')
end


## examples ##
p weirdcase( "String" )#=> returns "StRiNg"
p weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

## algorithm ##
# Split the string by whitespace, into an array of words
# Iterate over the words array, with the index position available
#   > If the index position is even, upcase the current element
#   > Otherwise, downcase the current element