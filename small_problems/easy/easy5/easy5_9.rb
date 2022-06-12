# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that contains the value of the 
# original string with all consecutive duplicate characters collapsed into a single character. 
# You may not use String#squeeze or String#squeeze!.



## note - I added values to an array and then converted that to a string via #join, but this was unnecessary. 
# could just #<< to a string object while iterating through str

def crunch(str)
  char_array = Array.new
  str.chars.each do |char|
    char_array << char unless char_array.last == char
  end
  char_array.join
end


## Problem ##
# input - string
# output - string
# reqs/rules
#   1) output will be a different string than input
#   2) output will contain characters from input in same order, but with consecutive duplicated characters removed
# questions

## Examples ##
p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

## Data/Algorithm ##
# > Given a string, str - 
#     1) Initialize an empty array
#     2) Iterate through the characters in string. Add each to the array, unless it equals the last value in the array
#     3) join the array values into a new string



## Further Exploration ##

=begin
You may have noticed that we continue iterating until index points past the end of the string. 
As a result, on the last iteration text[index] is the last character in text, while text[index + 1] is nil. 
Why do we do this? What happens if we stop iterating when index is equal to text.length?

(LS method for reference)

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

## > We will add a nil value to the end of the output string

Can you determine why we didn't use String#each_char or String#chars to iterate through the string? 
How would you update this method to use String#each_char or String#chars?
  
## > Made a note about this above, next to my original solution (which used String#chars).
# Its an unnecessary step to conver to an array and then convert back to a string.

You can solve this problem using regular expressions (see the Regexp class documentation). 
For a fun challenge, give this a try with regular expressions. 
If you haven't already read our book, Introduction to Regular Expressions, 
you may want to keep it handy if you try this challenge.

## > 

Can you think of other solutions besides regular expressions?
=end

def crunch_regex(text)
  consecutive_dupl = /(.)\1+/
  text.gsub(consecutive_dupl,'\1')
end

p crunch_regex('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch_regex('4444abcabccba') #== '4abcabcba'
p crunch_regex('ggggggggggggggg') #== 'g'
p crunch_regex('a') #== 'a'
p crunch_regex('') #== ''