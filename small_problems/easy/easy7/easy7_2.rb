# Lettercase Counter

# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the number of characters in the string that are lowercase letters, 
# one the number of characters that are uppercase letters, and one the number of characters that are neither.


## Problem ##
# input - string
# output - hash
# rules/reqs
#   1) output hash should contain three entries:
#       lowercase: count of lowercase letters
#       uppercase: count of uppercase letters
#       neither: count of non letter characters

require "pry-byebug"


def letter_case_count_sloppy(text)
  count_hsh = {lowercase: 0, uppercase: 0, neither: 0}

  text.chars.each do |char|
    #binding.pry
    if char.match?(/[a-zA-Z]/)
      char.match?(/[a-z]/) ? count_hsh[:lowercase] += 1 : count_hsh[:uppercase] += 1
    else
      count_hsh[:neither] += 1
    end
  end

  count_hsh
end


def letter_case_count(text)
  char_counts = Hash.new(0)
  text_chars = text.chars

  char_counts[:lowercase] = text_chars.count { |char| char.match?(/[a-z]/)}
  char_counts[:uppercase] = text_chars.count { |char| char.match?(/[A-Z]/)}
  char_counts[:neither] =  text_chars.count { |char| char.match?(/[^A-Za-z]/)}

  char_counts
end


## Examples ##
p letter_case_count('abCdef 123')# == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef')# == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123')# == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('')# == { lowercase: 0, uppercase: 0, neither: 0 }


## Data/Algorithm ##
# > Given a string, text - 
#   1) Initialize a hash object
#   2) Iterate over the characters in the string
#       2a) convert string to array then iterate over array
#   3) For each character iteration, check if the character is a letter
#       3a) if it is a letter, check if it is lowercase or uppercase. Update the hash values for :lowercase or :uppercase 
#           accordingly.
#       3b) If it is not a letter, update the hash value for :neither
