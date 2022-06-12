# Letter Swap


# Given a string of words separated by spaces, write a method that takes this string of words 
# and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. 
#You may also assume that each string contains nothing but words and spaces

## Problem ##
# input - string
# output - new string
# reqs/rules
#   1) every word has at least one letter
#   2) string will always have at least 1 word
#   3) strings have only words and spaces
#   4) output string should swap the first and last letters of each word (within itself)

## Simplify this!! ##

def swap_one_word(word)
  first = word[0]
  last = word[-1]
  word[0] = last
  word[-1] = first
  word
end

## LS supplied one line solution for swapping, using "multiple assignment": 

def swap_one_word_clean(word)
  word[0], word[-1] = word[-1], word[0]
end

 
=begin 
When Ruby sees something like this, it effectively creates a temporary array with the values from the right side ([b, a]), 
and then assigns each element from that array into the corresponding named variable:

a = b   # b is value from position 0 of temporary array (original value of b)
b = a   # a is value from position 1 of temporary array (original value of a)

temporary = [b, a]
a = temporary[0]
b = temporary[1]
=end


def swap(str)
  words = str.split
  words.map! { |word| swap_one_word(word) }.join(' ')
end

## Examples ## 
p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') # == 'ebcdA'
p swap('a') #== 'a'



## Data/Algorithm ##
# > Given a string, str - 
#     1) build an array containing the words in str, where words are designated by white space
#     2) iterate over the words in the array
#     3) swap the first and last letters of each word and add them to a new array
#     4) join the new array into a new string
#     5) return the new string



## Further exploration ##
# How come our solution passes word into the swap_first_last_characters method invocation 
# instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters_fe(a, b)
  a, b = b, a
end

#and called the method like this:

swap_first_last_characters_fe(word[0], word[-1])

# > The return value of the swap method in this case would be the array [b, a]. We would need to parse through that and
# still have to update the array with the new values