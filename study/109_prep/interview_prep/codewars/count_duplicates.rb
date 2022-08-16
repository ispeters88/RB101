# Counting Duplicates
# * 8:19 *
# Write a function that will return the count of distinct case-insensitive alphabetic characters 
# and numeric digits that occur more than once in the input string. 
# The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
# 
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice



## problem ##
# input - string
# output - integer
# rules/reqs
#   1) input string contains: alphanumeric characters. Letters can be either lowercase or uppercase
#   2) output value should be the count of duplicated characters
#   3) duplication analysis will be case-insensitive

def count_duplicates(str)
  counts = Hash.new(0)

  str.downcase.chars.each do |char|
    counts[char] += 1
  end

  counts.values.count { |qty| qty > 1 }
end


## examples ##
# p count_duplicates("abcde")
# p count_duplicates("")
# p count_duplicates("aabbcde")
# p count_duplicates("aabBcde")
# p count_duplicates("indivisibility")
# p count_duplicates("Indivisibilities")
# p count_duplicates("aA11")

def duplicate_count(text)
  text.downcase!
  text.chars.uniq.count { |char| text.count(char) > 1 }
end

p duplicate_count("abcde")
p duplicate_count("")
p duplicate_count("aabbcde")
p duplicate_count("aabBcde")
p duplicate_count("indivisibility")
p duplicate_count("Indivisibilities")
p duplicate_count("aA11")


## algorithm ##
# Initialize a local variable *counts* to an empty Hash object, with default value 0
# Force lowercase letters on the input string
# Iterate over the characters in the result of forcing lowercase
#   > increment the value in the counts hash for the key that is the current iteration element
# Iterate over the values of the counts hash and add up the number of values that are strictly greater than 1
