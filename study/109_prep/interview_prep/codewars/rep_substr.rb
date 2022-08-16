# Repeated Substring
# *21:42*

# For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.
# 
# The input string consists of lowercase latin letters.
# 
# Your function should return :
# 
# a tuple (t, k) (in Python)
# an array [t, k] (in Ruby and JavaScript)
# in C, return k and write to the string t passed in parameter

## problem ##
# input - string
# output - array
# rules/reqs
#   1) input string has length > 0
#   2) output array will contain two elements: a string _s_ and an integer _k_
# questions


def get_all_substrs(str)
  len = str.length
  all_subs = Array.new

  (0...len).each do |i|
    (i...len).each do |k|
      all_subs << str[i..k]
    end
  end

  all_subs
end

def rep_substr(str)
  all_substrs = get_all_substrs(str)
  all_substrs.sort_by!(&:length)
  len = str.length

  all_substrs.each do |substr|
    len.downto(1).each do |mult|
      return [substr, mult] if substr * mult == str
    end
  end
end

## examples ##
p rep_substr('abcabc')  # ['abc', 2]
p rep_substr('aaaaaa')  # ['a', 6]
p rep_substr('hello')   # ['hello', 1]
p rep_substr('')

## algorithm ##
# Initialize an empty array object, *all_subs*
# Find and store off all substrings of input string, add to all_subs
# Iterate over substrings:
#   > For each substr, start at length and iterate descendingly.
#   > Check if the current iteratiom count * substring is equal to the input string
#     If so, return the substring and the iteration count