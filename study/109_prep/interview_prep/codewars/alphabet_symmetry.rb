# Alphabet symmetry
# *19:00*

# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. 
# In the alphabet, a and b are also in positions 1 and 2. 
# Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
# 
# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. 
# For example,
# 
# solve(["abode","ABc","xyzD"]) = [4, 3, 1]

# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.


## problem ##
# input - array
# output - array
# rules/reqs
#   1) input array contains words that have both upper and lowercase characters. There will not be any spaces
#   2) output array should contain a count for each word from the input array. The count should represent the number of
#       characters from the corresponding word in the input array, whose position in the word match its position in the
#       alphabet
#   3) treat letters as case insensitive for purpose of alphabet position

def make_alphabet_hash
  hsh = Hash.new
  letter = 'a'
  1.upto(26) do |position|
    hsh[letter] = position
    letter = (letter.ord + 1).chr
  end
  hsh
end

def alpha_position_count(words)
  letter_positions = make_alphabet_hash
  counts = Array.new

  words.each do |word|
    symmetry_count = 0
    word.chars.each_with_index do |letter, idx|
      symmetry_count += 1 if idx + 1 == letter_positions[letter.downcase]
    end
    counts << symmetry_count
  end

  counts
end

## examples ##
p alpha_position_count([""]) # [0]
p alpha_position_count(["abc", "abc"]) # [3, 3]
p alpha_position_count(["zxy", "hello"]) # [0, 0]
p alpha_position_count(["abc", "zxy"]) # [3, 0]

p alpha_position_count(["abode","ABc","xyzD"])# ,[4,3,1])
p alpha_position_count(["abide","ABc","xyz"])# ,[4,3,0])
p alpha_position_count(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])# ,[6,5,7])
p alpha_position_count(["encode","abc","xyzD","ABmD"])# ,[1, 3, 1, 3])

## algorithm ##
# Create a hash containing lowercase alphabetic characters, mapped to their corresponding position in alphabet

# Iterate over the input array
#   > on each word, iterate over the letters (with index available) and count up any whose index position in the word
#     matches its value from the alphabet hash
# Add each count result to a new array