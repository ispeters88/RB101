# All Substrings

# Write a method that returns a list of all substrings of a string. 
# The returned list should be ordered by where in the string the substring begins. 
# This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, 
# and so on. Since multiple substrings will occur at each position, 
# the substrings at a given position should be returned in order from shortest to longest.
# 
# You may (and should) use the leading_substrings method you wrote in the previous exercise:

def leading_substrings(string, substrings, start)
  string[start..].chars.each_index do |idx|
    substrings << string[start..][0..idx]
  end
end

def substrings(string)
  substrings = Array.new

  string.length.times do |index|
    leading_substrings(string, substrings, index)
  end

  substrings
end


## Examples ##
p substrings('abcde')# == [
#  'a', 'ab', 'abc', 'abcd', 'abcde',
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'd', 'de',
#  'e'
#]