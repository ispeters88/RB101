# Welcome Stranger

# Create a method that takes 2 arguments, an array and a hash. 
# The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. 
# The hash will contain two keys, :title and :occupation, and the appropriate values. 
# Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

def greetings(name_arr, details_hsh)
  full_name = name_arr.join(' ')
  "Hi there, #{full_name}! Your rise to #{details_hsh[:title]} #{details_hsh[:occupation]} is truly impressive"
end

## Problem ##
# input - 1) array, 2) hash
# output - string
# rules/reqs
#   1) input array contains 2 or more strings that combine to form a full name
#   2) input hash contains a title (key :title) and an occupation (key :occupation)
#   3) output string should take the form of a greeting that
#      uses the full name from the input array and the
#       title and occupation from the input hash

## Example ##
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

## Data/Algorithm ##
# > Given an array containing elements of a name, and a hash containing details about that person -
#     1) Join the array elements into a single string, with space delimiters
#     2) Create a string containing the name and the title/occupation details

## Furher/Exploration ##
# This method doesn't actually pass rubocop!
# What is the best way to shorten the lines in this method
# so it doesn't exceed the 80 maximum characters to a line?

def greetings_fe(name, hsh)
  greeting = "Hi there, #{full name}!
              Your rise to #{hsh[:title]} #{hsh[:occupation]}
              is truly impressive!"
  greeting
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
