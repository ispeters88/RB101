# Uppercase Check

# Write a method that takes a string argument, 
# and returns true if all of the alphabetic characters inside the string are uppercase, 
# false otherwise. Characters that are not alphabetic should be ignored.

LETTERS = /[A-Za-z]/

def uppercase?(string)
  string.chars.select do |char|
    char.match?(LETTERS)
  end.all? { |letter| letter.upcase == letter }
end


## Examples ##
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


## Data/Algorithm ##
# > Given a string, str -
#     1) Iterate over the characters in str, adding each letter character to an array
#     2) Iterate over the array and check that ALL values are uppercase
#     3) Return true if so, false otherwise

## NOTE ##
# LS provided solution is much cleaner, and clever. 

def uppercase_ls?(string)
  string == string.upcase
end


## Further Exploration ##
# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string. 
# Would it make sense to return false instead? Why or why not?

# >> It makes sense to me to return true, given the problem description. An empty string does not have any alphabetic
# characters that are non-uppercase, so we should return true