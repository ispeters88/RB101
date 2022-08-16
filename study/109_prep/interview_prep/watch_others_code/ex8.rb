# 8. (part 5)
# * 17:03 *

=begin
Find length of the longest substring in the given string that is the same in reverse. 
As an example, if the input ws "I like racecars that go fast", the substring ('racecar') length would be 7. 
If the length of the input string is 0, return value must be 0.

=end


## problem & data structures ##
# input - string
# output - Integer
# rules/reqs
#   1) input string can contain letters and numbers (explicit). Unclear if all case matters. [Will assume it does not]
#   2) output should be the length of the longest possible substring in the input string, such that the substring is a
#      palindrome - i.e. has the same value when reversed
#   3) possible output values are 0 - length of input string (if the input string itself is a palindrome)


def get_all_substrings(string)
  substrings = Array.new
  input_len = string.length

  (0...input_len).each do |i|
    (1..input_len - i).each do |k|
      substrings << string.slice(i, k)
    end
  end

  substrings
end

def is_pal?(string)
  string.reverse == string
end

def longest_palindrome_opt2(string)
  substrings = get_all_substrings(string)

  pal_subs = substrings.select { |substr| is_pal?(substr) }
  
  pal_subs.max_by { |pal| pal.length }.length
end


def longest_palindrome_opt1(string)
  substrings = get_all_substrings(string)
  substrings.sort_by(&:length).reverse.each do |substr|
    return substr.length if is_pal?(substr)
  end

  false
end


## examples ##
p longest_palindrome_opt2('a')  == 1
p longest_palindrome_opt2('aa')  == 2
p longest_palindrome_opt2('baa')  == 2
p longest_palindrome_opt2('aab')  == 2
p longest_palindrome_opt2('baabcd')  == 4
p longest_palindrome_opt2('baablkj12345432133d')  == 9 

## algorithm ##
# Find and store off all substrings of the input string
#
#   1. Initialize a local var substrings to an empty Array object
#   2. Iterate over 0 to length of input string; on each iteration, with iter counter i:
#         > Iterate over 1 to length of input string minus i; on each iteration, with iter counter k:
#             > take a slice of the input string starting at index i and having length k
#             > push that slice to the substrings array
#   3. Return the substrings array

#
# > option 1
# Sort the substring list in descending order by length. Iterate over the sorted list
#   > at each iteration, check the current substring to see if it is the same when reversed
#   > if so, return the length of the current substring
#   > if not, proceed to next iteration
# If iteration completes, return 0

# > option 2
# Remove all substrings that are *not* palindromes from the substring list. 
#
#   > Use select to filter out non palindromes

# Take maximum value of remaining substrings by their length
#   > Use max_by to sort by the length
