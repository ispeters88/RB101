# Count letters in string
# 
# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. 
# The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.


## problem ##
# input - string
# output - hash
# rules/reqs
#   1) the output hash should contain key/value pairs where each key is a letter from the input string, and the value is the count of that letter in the string
#   2) the keys should be symbols
#   3) only lowercase letters should be counted


def letter_count(str)
  counts = Hash.new(0)

  str.chars.each do |char|
    counts[char.to_sym] += 1 if char.match?(/[a-z]/)
  end

  counts
end


## examples ##
p letter_count('launch school')
p letter_count('')
p letter_count('This will test SOME uppercase characters')
p letter_count('eeeeeee')



## algorithm ##
# Initialize an empty Hash object with default value 0
# Iterate over the characters in the input string.
#   > If character is a lowercase letter, add 1 to the value associated with the symbol associated with the character, within the hash initialized in step 1
# Return the hash

