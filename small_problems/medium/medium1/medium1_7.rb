# Word to Digit

# Write a method that takes a sentence string as input, 
# and returns the same string with any sequence of the words 
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

WORD_TO_NUMBER = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
                   'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
                   'eight' => '8', 'nine' => '9' }

def word_to_digit(str)
  WORD_TO_NUMBER.each do |word, num|
    str.gsub!(/\b#{word}\b/, num)
  end
  str
end

## Examples ##
p word_to_digit('Please call me at five five five one two three four. Thanks.')# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


## Further Exploration ##
# There are many ways to solve this problem and different varieties of it. 
# Suppose, for instance, that we also want to replace uppercase and capitalized words.
# 
# Can you change your solution so that the spaces between consecutive numbers are removed? 
# Suppose the string already contains two or more space separated numbers (not words); 
# can you leave those spaces alone, while removing any spaces between numbers that you create?
# 
# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? 
# For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

def word_to_digit_fe(str)
  WORD_TO_NUMBER.each do |word, num|
    str.gsub!(/\b#{word}\b/, num)
  end
  str.gsub!(/(\d)(\s)/, '\1')
  str.gsub!(/(\d)([a-z])/i, '1 \2')
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  str
end

#str_arr = str.split
#  map { |word| WORD_TO_NUMBER.key?(word) ? WORD_TO_NUMBER[word] : word }
#  .join(" ")

#WORD_TO_NUMBER.each do |word1, num1|
#  WORD_TO_NUMBER.each do |word2, num2|
#    str.gsub!(/\b#{word1}\b\s\b#{word2}\b/)
#  end
#end


## Examples ##
p word_to_digit_fe('These are 2 2 tests of one two problems')
p word_to_digit_fe('Please call me at one two three five five five one five three four. Thanks.')