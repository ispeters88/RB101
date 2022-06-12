# Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

CONSONANTS = /[a-z&&[^aeiou\s]]/i

def double_consonants(string)
  string.chars.map { |char| char.match?(CONSONANTS) ? char * 2 : char }.join
end


## Examples ##
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!")  == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""