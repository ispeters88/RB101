# 2. (part 1, second problem)

=begin 
Given array of strings made only of lowercase letters, return array of all characters that 
show up in all strings within the given array (including duplicates) For example, 
if a character occurs 3 times in all strings, but not 4 times, you need to include that character three times 
in the final answer.


p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz) == []
=end


## problem ##
# input - array
# output - array
# rules/reqs
#   1) input array contains strings
#   2) strings in input array are made up of only lowercase letters
#   3) output array should contain characters that are contained within all strings in the array, at the minimum multiplicity
#      amongst all strings

def get_char_min_counts(words)
  words.first.chars.each_with_object(Hash.new(0)) do |char, counts|
    char_counts = words.map { |word| word.count(char) }
    counts[char] = char_counts.min
  end
end


def common_chars_hashed(words)
  char_min_counts = get_char_min_counts(words)
  commons = Array.new

  char_min_counts.each do |char, count|
    count.times do 
      commons << char
    end
  end

  commons
end

def common_chars(words)
  common_chars = Array.new

  words.first.chars.uniq.each do |char|
    min_count = words.map { |word| word.count(char) }.min
    min_count.times do
      common_chars << char
    end
  end

  common_chars
end


## examples ##
p common_chars(['bella', 'label', 'roller'])# == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook'])# == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random'])# == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz))# == []

## algorithm ##
#     Hash Version    #

# Initialize a local variable, commons, to an empty Array object
# Create a Hash object with character counts for each word in the input array
#   > keys are characters
#   > values are counts of the characters in the word
# Transform the Hash object so the values are arrays of each count of the character in all the words


#     No Hash         #
# Initialize a local variable, commons, to an empty Array object
# Iterate over the characters in the first string of the input array
#   > Get the minimum count of the character from all the words and set to local variable min_count
#   > Add the character to commons, min_count times
# return commons array



## Notes ##
# order of the elements in the output array was a tricky variable here - was useful once I realized that I really needed
# to focus on the first word in the input array, since our return values were based on the character positioning of
# that first word
