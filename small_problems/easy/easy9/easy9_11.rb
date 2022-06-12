# Group Anagrams

# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'xylophone']

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:


## Examples ##
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

## Problem ##
# input - array
# output - 0 or more arrays, displayed to console
# rules/reqs
# questions
#     1) is it possible for the input array to be empty?


def display_anagrams(word_arr)
  word_letters = word_arr.map { |word| word.split('').sort }

  word_letters.uniq.each do |letters|
    p word_arr.find_all { |word| word.split('').sort == letters }
  end
end

display_anagrams(words) 

## Data/Algorithm ##
# > Given an array containing some number of words, word_arr - 
#     1) Initialize two new arrays, word_letters, and anagrams
#     2) Iterate over word_arr
#         On each iteration, split the characters in the word, sort them, and add the result to word_letters
#     3) Iterate over unique values in word_letters
#         On each iteration, search all of word_letters for subarrays that match the current subarray. Add them to anagrams