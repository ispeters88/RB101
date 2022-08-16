# 7. (part 4, second problem)

# * 12:50 *

=begin
Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, 
otherwise return false. 
For example: 
str1 is 'rkqodlw' and str2 is 'world' the output should return true
=end 


## problem & data structures ##
# input - two string objects
# output - boolean
# rules/reqs
#   1) function returns true if and only if there exists a permutation of the first input string, which itself
#      has a permutation which equals the second input string
#   2) no explicit rules about types of characters in the strings; examples only include lowercase letters

def scramble(str1, str2)
  str2_len = str2.length
  str2_sorted = str2.chars.sort.join
  str1.chars.combination(str2_len).each do |portion|
    return true if portion.sort.join == str2_sorted
  end

  false
end


## examples ##
p scramble('javaass', 'jjss') == false 
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqty', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true 

## algorithm ##
# Calculate the length of string 2 and store it to a local var
# Get all permutations of string 1 of that length, and store them to a local var perms_str1
#   > convert string 1 to an array of characters, than run Array#combination(length) over that array

# Iterate over perms_str1
#     > check if the current permutation sorted, is equal to str2 sorted
#     > if so on any permutation, immediately return true
# If iteration completes, return false


# note - believe that if string 1 is shorter than string 2, we should automatically return false


# we know that the portion extracted from string 1 needs to have the same length as string 2
