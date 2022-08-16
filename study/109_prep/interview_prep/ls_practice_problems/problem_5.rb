##           ##
## Problem 5 ##
##           ##

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

## problem/data structures ##
# input - string
# output - string (single character)
# goal - return the character from the input string that occurs the least number of times
# rules
#   1) case insensitive when counting letters
#   2) if there is more than one character with the lowest frequency, return the first one based on positioning in the original input string
#   3) whitespace counts as a character for counting purposes

## algorithm ##
# Initialize a local variable *counts* to an empty Hash object with default value 0
# Iterate over the characters in the input string
#   > increment the value for the key in counts that is the current iteration character, by 1
# Iterate over the counts hash and return the key(s) associated with the minimium value(s). If there is more than 1, return the first one

#   1) 


def get_char_counts(string)
  counts = Hash.new(0)

  string.each_char do |char|
    counts[char.downcase] += 1
  end

  counts
end


def least_common_char(string)
  counts = get_char_counts(string)
  counts.min_by { |char, count| count }.first
end


# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".