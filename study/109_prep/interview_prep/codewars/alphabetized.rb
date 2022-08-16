# Alphabetized

# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in 
# "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
# 
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

## Problem ##
# input - string
# output - string
# rules/reqs
#   1) strip all whitespace and punctutation
#   2) sort the remaining characters by alphabetical order with no case sensitivity

require "pry-byebug"

def condense_str(str)
  str.gsub(/[\W_]/,"").chars
end


def alphabetized(str)
  short_str_arr = condense_str(str)
  short_str_arr.sort(&:casecmp).join
end


## Examples ##
p alphabetized("")# , "")
p alphabetized(" ")# , "")
p alphabetized(" a")# , "a")
p alphabetized("a ")# , "a")
p alphabetized(" a ")# , "a")
p alphabetized("A b B a")# , "AabB")
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")# , "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ")
p alphabetized("!@$%^&*()_+=-`,")# , "")
p alphabetized("The Holy Bible")# , "BbeehHilloTy")
p alphabetized("CodeWars can't Load Today")# , "aaaaCcdddeLnooorstTWy")

## algorithm ##
# Remove all whitespace and punctutation
# Sort remaining characters and return result



# Sort
# 1) iterate over the characters in the string; on each iteration
#     1a) > check if 