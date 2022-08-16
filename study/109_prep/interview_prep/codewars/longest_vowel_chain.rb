# Longest vowel chain
# 
# The vowel substrings in the word codewarriors are o,e,a,io. 
# The longest of these has a length of 2. 
# Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, 
# return the length of the longest vowel substring. Vowels are any of aeiou.


## problem ##
# input - string
# output - integer
# rules/reqs
#   1) input string can contain any alphabetic characters
#   2) return value should return the max length of all possible vowel substrings from the input string

def get_vowel_subs(letters)
  all_subs = Array.new
  tmp_sub = ''

  letters.each do |letter|
    if letter.match?(/[aeiou]/)
      tmp_sub << letter
    else
      all_subs << tmp_sub
      tmp_sub = ''
    end
  end
  all_subs << tmp_sub

  all_subs.select { |sub| sub.length > 0 }
end

def vowel_chain_max(array)
  letters = array.chars
  char_count = letters.size

  vowel_subs = get_vowel_subs(letters)
  vowel_subs.map(&:length).max
end

## examples ##

p vowel_chain_max("suoidea")# ,3)
p vowel_chain_max("iuuvgheaae")# ,4)
p vowel_chain_max("ultrarevolutionariees")# ,3)
p vowel_chain_max("strengthlessnesses")# ,1)
p vowel_chain_max("cuboideonavicuare")# ,2)
p vowel_chain_max("chrononhotonthuooaos")# ,5)
p vowel_chain_max("iiihoovaeaaaoougjyaw")# ,8)


## algorithm ##

# Convert the input string into an array
# Generate a list of all substrings of the input string
# Find the max value of these substrings

# find substrings
# Iterate over letters
# > Create temp list to store vowels
# > when vowels are encountered, add them to it
# > when consonants are encountered, push the current contents of the temp list to a results list, then clear the temp list
# 
# 