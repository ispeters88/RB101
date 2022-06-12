# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are palindromic. 
# That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
# The return value should be arranged in the same sequence as the substrings appear in the string. 
# Duplicate palindromes should be included multiple times.
# 
# You may (and should) use the substrings method you wrote in the previous exercise.
# 
# For the purposes of this exercise, you should consider all characters and pay attention to case; 
# that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
# In addition, assume that single characters are not palindromes.


## Problem ##
# input - string
# output - array
# rules/reqs -
#     1) output array should contain all substrings of input string that are palindromes
#     2) palindromes consist of the same sequence of characters forwards and backwards
#     3) if the same palindrome substring appears multiple times in the input string, it should be included that many
#         times in the output array
#     4) all characters should be considered and case matters
#     5) single character substrings are NOT palindromes


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

def is_palindrome?(substring)
  substring.length > 1 && substring == substring.reverse
end


def palindromes(string)
  all_substrings = substrings(string)

  all_substrings.select { |substring| is_palindrome?(substring) }
end


## Examples ##
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
 '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes')  == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('Abcba')
p palindromes("Abc-bA")



## Further Exploration ##
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? 
# Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

# question - should the substrings we return include the ignored non-alphanum characters?

puts "Further Exploration"

require "pry-byebug"

ALPHA_NUM = /[A-Za-z0-9]/

def is_palindrome_fe?(substring)
  mod_string = substring.chars.select { |char| char.match?(ALPHA_NUM) }.join.downcase
  substring.length > 1 && mod_string == mod_string.reverse
end

def palindromes_fe(string)
  all_substrings = substrings(string)
  #binding.pry
  all_substrings.select { |substring| is_palindrome_fe?(substring) }
end

#p palindromes_fe('abcd')
#p palindromes_fe('madam')
p palindromes_fe('hello-madam-did-madam-goodbye')
p palindromes_fe('knitting cassettes')
p palindromes_fe('Abcba')
p palindromes_fe("Abc-bA")