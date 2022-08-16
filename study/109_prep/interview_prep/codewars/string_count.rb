# Count letters in string
# * 5:28 *
# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' 
# as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.


## problem ##
# input - string
# output - hash
# rules/reqs
#   1) no explicit or implicit rules on types of characters in input string
#   2) output hash should contain all lowercase letters from the input string together with their corresponding counts


def letter_count(string)
  counts = Hash.new(0)
  string.chars.sort.each { |char| counts[char.to_sym] += 1 }
  counts
end


## examples ##
p letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


## algorithm ##
# Initialize local var *counts* to an empty Hash object with default value 0
# Sort the characters in the input string
# Iterate over the sorted characters; on each iteration:
#     > increment the value for the key that is the current iteration's symbol counterpart, by 1
# Return the counts hash

