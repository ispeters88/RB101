# Replace With Alphabet Position
# 
# In this kata you are required to, given a string, replace every letter with its position in the alphabet.
# 
# If anything in the text isn't a letter, ignore it and don't return it.

## problem ##
# input - string
# output - string
# rules/reqs
#   1) every letter in input string should be mapped to its position in the alphabet (1-26), into the output string
#   2) output string should include only (mapped) letter characters from the input string. ignore non-letter characters

def make_alphabet_hash
  letter, position = 'a', 1
  alpha_hsh = Hash.new("")

  loop do
    alpha_hsh[letter] = position.to_s
    break if letter == 'z'
    letter = (letter.ord + 1).chr
    position += 1
  end

  alpha_hsh
end

def alphabet_position(string)
  alpha_pos = make_alphabet_hash

  string.chars.map do |char|
    alpha_pos[char.downcase]
  end.delete_if { |ch| ch == "" }.join(" ")
end



## Examples ##

p alphabet_position("The sunset sets at twelve o' clock.") #, "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11")
p alphabet_position("-.-'")# , "")



## algorithm ##
# Create a hash containing the letters in the alphabet with their corresponding positional value.
# Iterate over the input string, ignoring non-letter characters, and replace any letter characters with that character's value
# from the alphabet hash

# 1) Create a hash with 26 key value pairs, and default value "".
#     > Each key should be a letter in the alphabet. Each value is its position in the alphabet
# 2) convert input string to an array
# 3) iterate over the array from #2. On each iteration, pass the value from the array as a key into the hash from #1, and 
#    transform the array value into the hash value. Return a new array containing these transformed values.
# 4) remove any whitespace characters from the array
# 5) join the transformed array back into a string

