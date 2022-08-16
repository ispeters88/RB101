# Return substring instance count
# 
# Complete the solution so that it returns the number of times the search_text is found within the full_text.
# time spent: * 14:15 *

## problem ##
# input - two strings
# output - integer
# rules/reqs
#   1) output integer should represent the number of times the 2nd argument appears in the 1st argument
#   2) 

def find_all_substrings(text)
  size, i = text.length, 0
  all_subs = Array.new
  chars = text.chars

  loop do
    k = i
    loop do
      all_subs << chars[i..k]
      k += 1
      break if k == size
    end
    i += 1
    break if i == size
  end

  all_subs
end

def solution(full_text, search_text)
  sub_count = 0
  subs = find_all_substrings(full_text).map(&:join)
  subs.each { |str| sub_count += 1 if str == search_text}
  sub_count
end


## examples ##
p solution("test", "e")
p solution('abcdeb', 'b')
p solution('abbc', 'bb')
p solution('none here', 'x')
p solution('hello little llama', 'll')

## algorithm ##
# Initialize a local variable sub_count to 0
# Find and store off all substrings of argument #1
# Iterate over list of all substrings from step #1
#    > if argument #2 is equal to the substring in the current iteration, add 1 to sub_count


# Find all substrings
#   1) initialize a counting variable i to 0, and a second variable size to the length of the input string
#   2) initialize a variable all_subs to an empty Array object
#   3) convert string to an array of characters
#   4) iterate over the values in the character array
#       > initialize a second counting variable, k, to the current value of i
#       > start a 2nd/nested iteration
#           > take slices of input string from i to k. Add them to all_subs
#           > break when k equals the size of the array (length of the string)
#       > add 1 to the value of i
#       > break when i equals the size of the array (length of the string)