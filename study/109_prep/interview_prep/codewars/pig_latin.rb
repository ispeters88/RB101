# Simple Pig Latin
# * 9:18 *

# Move the first letter of each word to the end of it, then add "ay" to the end of the word. 
# Leave punctuation marks untouched.


## problem & data structures ##
# input - string
# output - string
# goal - transform each word in the input string into its pig latin version; return the transformed string
# rules/reqs
#   1) input string can contain uppercase and lowercase letters, and punctuation
#   2) punctuation should not be transformed
#   3) "pig latin" means the first letter of a word moves to the end of that word, and then the two characters 'ay' are added
#      directly after that first letter

def pig_it(string)
  words = string.split

  words.map! do |word|
    if word.match?(/[.?!;:]/)
      word
    else
      new_word = word.chars
      new_word << new_word.shift << 'ay'
      #new_word << 'ay'
      new_word.join
    end
  end

  words.join(" ")
end


## examples ##
p pig_it('Pig latin is cool') # igPay atinlay siay oolcay
p pig_it('Hello world !')     # elloHay orldway !
p pig_it('This is my string') # 'hisTay siay ymay tringsay')


## algorithm ##
# Create an array of words from the input string. Words should be delineated by whitespace
# Iterate over the array of words;
#   > if the first letter is a letter, remove it from the beginning of the word and add it to the end of the word
#   > then add 'ay' to the end of the word



# Dealing with punctuation...
