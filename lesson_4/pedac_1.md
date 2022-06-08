#1

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

Edge case results we can assume:
  nil string value - no change
  if already upcase, don't touch
  
Edge cases we can't assume:
  will the supplied input always be a string?
  define palindrome, including how character case is involved

# input: String object
# output: new_String object
# rules - see above

#2)

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


# input - String object
# output - Array object (arr), containing String objects
# rules
  Palindromes are case sensitive
  if none found, return a blank array
  if nil String, return blank array
# rules questions
  Are spaces legal? - ie. 'p o p'

# Algorithm
Given a string str,
  Initialize an array object, arr
  Iterate over the possible combinations of substrings for the string
    Initialize a new array, sub_arr - with all possible substrings
    loop over this array
  If a substring is a palindrome (see rules), add to arr

# method # get_substrings(str)
Given a String str
  Create an empty Array object, arr = Array.new
  Set variable idx = 0 = start
  Iterate over all characters in str,  start -> str.length - 2
    initialize variable num_chars = 2
    Iterate over all characters in str, start + 2 -> str.length - start
      take slice - str[idx, num_chars]
      arr.push(slice)
      num_chars += 1
    end
  idx += 1
  end

def get_substrings(str)

end