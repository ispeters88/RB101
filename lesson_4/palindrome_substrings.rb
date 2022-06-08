# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# input: string - str
# output: str (same string), with any/all palindromes uppercased

# questions

def get_substrings(str)
  result = Array.new(0)
  start = 0
  while start < str.length - 1
    num_chars = 2
    while num_chars <= str.length - start
      result << str[start, num_chars]
      num_chars += 1
    end
    start += 1
  end
  return result
end

def is_palindrome?(word)
  word == word.reverse
end

def palindrome_substrings(str)
  substring_arr = get_substrings(str)
  result = Array.new(0)
  substring_arr.each do |subs|
    result << subs if is_palindrome?(subs)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")