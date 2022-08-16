# 1. (part 1, first problem)

# * 15:49 *

=begin
Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring together. 
Assume given string consists of lowercase English letters only.



Example 1: 
Input: 'abab'
Output: true 
Explanation: It's the substring 'ab' twice.
Example 2: 
Input: 'aba'
Output: false
Explanation: String cannot be constructed from repeating substring. 
p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true 
p repeated_substring_patten('abcabcabcabc') == true 
=end 

## problem ##
# input - string 
# output - boolean
# rules/reqs
#   1) input string is
#         a] non-empty - length > 0
#         b] characters are lowercase English letters
#   2) return true if there exists a substring of the input string such that some integer k > 1 multiplied by the substring equals the input string; else return false

def find_all_substrings(str)
  i, len = 0, str.length
  all_substrs = Array.new

  loop do
    k = i
    loop do
      all_substrs << str[i..k]
      k += 1
      break if k == len
    end
    i += 1
    break if i == len
  end

  all_substrs
end



def repeated_substring_pattern(str)
  all_substrs = find_all_substrings(str)
  input_length = str.length

  all_substrs.select do |substr|
    sub_len = substr.length
    next if input_length % sub_len != 0 || sub_len == input_length

    k = input_length / sub_len

    return true if substr * k == str
  end
  false
end



## examples ##
p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true 
p repeated_substring_pattern('abcabcabcabc') == true 

## algorithm ##
# Find and store off all substrings of input string
# Calculate length of input string
# Remove any substrings whose length does not evenly divide input string's length
# Iterate over the substrings; on each iteration
#   > calculate the length of the substring
#   > calculate the possible multiplier value k - this is the length of the input string divided by the length of the current substring
#   > check if the current substring multiplied by k is equal to the input string. if so, return true
# If iteration finishes, return false

# Find all substrings
# 
# Initialize a local variable *all_substrs* to an empty Array object
# Perform a nested iteration over the characters in the string. Given outer counter i (initialize to 0) and inner count k - 
#   > set k to current value referenced by i
#   > Iterate over values of k from i to length of string; on each iteration:
#       > take a slice of original string from i to k, add to all_substrs
#       > increment k by 1
#   > Increment i by 1
#   > Stop when i is equal to the length of the input string