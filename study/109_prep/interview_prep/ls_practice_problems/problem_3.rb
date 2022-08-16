# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# The tests above should print "true".

## problem ##
# input - string
# output - string
# goal - transform the input string, such that every 2nd character in every 3rd word is uppercase. Other characters
#        should be unchanged
# rules/reqs
#   1) input string can have any combination of uppercase and lowercase letters
#   2) "words" are delineated by whitespace

def to_weird_case(string)
  new_words = Array.new

  string.split.each_with_index do |word, word_idx|
    if word_idx > 0 && (word_idx+1) % 3 == 0
      new_words << word.each_char.map.with_index { |char, char_idx| char_idx.odd? ? char.upcase : char }.join
    else
      new_words << word
    end
  end

  new_words.join(" ")
end



## examples ##
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

## algorithm ##
# Initialize local var new_words to an empty Array object
# Convert string into array of words
# Iterate over words array, with index available
#     > if the index does not evenly divide 3, proceed to next iteration
#     > otherwise, convert characters in word to an array, and run transformation over that array such that characters at
#       odd index positions are converted to uppercase. Join them back together into a word to be added to the returned
#       word array
# Join the words array together into a string, with white space as delimiter, and return that resulting string