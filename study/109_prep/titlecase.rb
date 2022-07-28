# Title Case

# A string is considered to be in title case if each word in the string is either (a) capitalised 
# (that is, only the first letter of the word is in upper case) or (b) considered to be an exception 
# and put entirely into lower case unless it is the first word, which is always capitalised.

# Your function should ignore the case of the minor words string -- 
# it should behave in the same way even if the case of the minor word string is changed.

## Problem ##
# input - string, optional string containing space delimited words
# output - string (see questions below)
# rules/reqs
#   1) 1st word in output string is always capitalized
#   2) all subsequent words in output string is capitalized unless it is found in the optional 2nd argument list
# questions
#   1) should the output string be a new object, or the same String object via mutation?
#       > will assume it should be a new string object


def title_case(title,minor_words='')
  exceptions = minor_words.split.map { |minor| minor.downcase }

  title.split.map.with_index do |word, idx|
    if idx == 0
      word.capitalize
    else
      exceptions.include?(word.downcase) ? word.downcase : word.capitalize
    end
  end.join(" ")
end

## Examples ##
p title_case('a clash of KINGS', 'a an the of')# , 'A Clash of Kings')
p title_case('THE WIND IN THE WILLOWS', 'The In')#, 'The Wind in the Willows')
p title_case('the quick brown fox')#, 'The Quick Brown Fox')


## Data/Alg ##
# > Given a string str, and an optional second string, list - 
#     1) Initialize a variable exceptions, pointing to an array object, and add any words from list to it.
#     2) Split str into separate words and add to an array
#     3) Iterate over the array; on each iteration :
#         > Capitalize the current word, if it is the 1st iteration
#         > Otherwise, check if word is contained in the exceptions array (case insensitive check). If it is, downcase it
#         > Otherwise, capitalize the word