# Detect Pangram
# Solve time: *14:18* (*10:08* for general solution, needed a few more minutes to test out what characters \W doesn't cover)
# A pangram is a sentence that contains every single letter of the alphabet at least once. 
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
# 
# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


## problem ##
# input - string
# output - boolean
# rules/reqs
#   1) return `true` if input string is a pangram; `false`` otherwise
#   2) definition of pangram: contains every letter of the alphabet (case insensitive) at least once. Can be more than once
#   3) ignore numbers and punctuation

def is_pangram?(string)
  counts = Hash.new
  ('a'..'z').each { |letter| counts[letter] = 0 }
  
  string.downcase.gsub(/[\W\d_]/,"").chars.each do |char|
    counts[char] += 1
  end
  
  counts.values.all? { |count| count > 0 }
end


## examples ##
p is_pangram?("The quick brown fox jumps over the lazy dog")    #true
p is_pangram?("Hello!")    # false

## algorithm ##
# Initialize a hash for the counts of each letter within the input string
# Iterate over the characters in the input string, adding the count of each to the hash
# Return true if the value of each element in the hash is > 0; else return false
