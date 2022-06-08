# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

def is_palindrome?(str)
  str == str.reverse
end

def change_me(str)
  words = str.split
  words.map { |word| word.upcase! if is_palindrome?(word) }
  words.join(' ')
end

p change_me("I LOVE my mom and dad equally")
p change_me('')
p change_me('No palindromes')