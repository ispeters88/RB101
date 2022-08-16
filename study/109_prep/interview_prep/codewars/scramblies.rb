# Scramblies
# *** This was a disaster - over 30 minutes ***
# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
# 
# Notes:
# 
# Only lower case letters will be used (a-z). No punctuation or digits will be included.
# Performance needs to be considered.


## problem ##
# input - two strings, str1 and str2
# output - boolean
# rules/reqs
#   1) try to rearrange a portion of str1 to match all of str2
#   2) if doable, return `true`; else, return `false`
#   3) all lowercase letters

require "pry-byebug"

def scramble_v1(str1, str2)
  str2_len = str2.length
  orig_str1_len = str1.length

  return false if str1.length < str2_len

  str2.chars.each do |char|
    str1.slice!(str1.index(char)) if str1.include?(char) 
  end

  orig_str1_len - str1.length == str2_len
end

def scramble(str1, str2)
  return false if str1.length < str2.length
  str2.chars.select { |char| str1.count(char) < str2.count(char) }.size == 0
end


## examples ##
p scramble("hello there", "hero")
p scramble("hero", "hello there")
p scramble("xyz", "regular letters")
p scramble("regular letters", "xyz")

p scramble('rkqodlw','world')# ,true)
p scramble('cedewaraaossoqqyt','codewars')# ,true)
p scramble('katas','steak')# ,false)
p scramble('scriptjava','javascript')# ,true)
p scramble('scriptingjava','javascript')# ,true)


## algorithm ##
# Return false if length of str1 is less than length of str2
# Convert str1 and str2 into character arrays
# Iterate over str1 and Look for values from str2 within str1; anytime a match is found, remove it from str2's character array
# Return true if str2's character array is empty; false otherwise


# take intersection of str1 and str2; if it is 