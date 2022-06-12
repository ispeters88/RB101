# Staggered Caps (Part 1)

# Write a method that takes a String as an argument, 
# and returns a new String that contains the original value using a 
# staggered capitalization scheme in which every other character is capitalized, 
# and the remaining characters are lowercase. 

# Characters that are not letters should not be changed, 
# but count as characters when switching between upper and lowercase.

## Problem ##
# input - string
# output - new string
# rules/reqs
#   1) implied - first character should be capitalized, then alternate from there


def staggered_case(str)
  new_str = ''
  
  str.chars.each_with_index do |char, idx|
     new_str << (idx.odd? ? char.downcase : char.upcase)
  end

  new_str
end



## Examples ##
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


## Data/Algorithm ##
# > Given a string, str - 
#     1) iterate over characters in string
#     2) on each iteration, check if the iteration number is odd
#       2a) if so, convert the character to lowercase
#       2b) otherwise, convert the character to uppercase


def staggered_case_loop(str)
  char_idx = 0
  staggered_str = ''

  loop do
    staggered_str << (char_idx.odd? ? char.downcase : char.upcase)
    char_idx += 1
    break if char_idx == str.size
  end

  staggered_str
end


## Further Exploration ##
# Can you modify this method so the caller can request that the first character be downcased rather than upcased? 
# If the first character is downcased, then the second character should be upcased, and so on.
# 
# Hint: Use a keyword argument.

require "pry-byebug"

def staggered_case_fe(str, need_upper=false)
  #binding.pry
  str.chars.map do |char|
    need_upper = !need_upper
    need_upper ? char.upcase : char.downcase
  end.join
end

p staggered_case_fe('I Love Launch School!', true)# == 'I LoVe lAuNcH ScHoOl!'
p staggered_case_fe('ALL_CAPS')# == 'AlL_CaPs'
p staggered_case_fe('ignore 77 the 444 numbers')# == 'IgNoRe 77 ThE 444 NuMbErS'