# The End Is Near But Not Here

# Write a method that returns the next to last word in the String passed to it as an argument.
# 
# Words are any sequence of non-blank characters.
# 
# You may assume that the input String will always contain at least two words.


def penultimate(str)
  str.split[-2]
end


## Examples ##
p penultimate('last word') #== 'last'
p penultimate('Launch School is great!')# == 'is'


## Further Exploration ##
# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: 
# strings that contain just one word, and strings that contain no words.
# 
# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? 
# How would you handle those edge cases without ignoring them? Write a method that 
# returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

## Edge cases

# 3) no words (empty string)
# 4) 1 word
# 3) 2 or more words
#   3a) odd number of words
#   3b) even number of words
#       for this one, we need to define what "middle" means

def penultimate_fe(str)
  words = str.split
  size = words.size 
  middle = words.size / 2

  if words.size < 2
    words.size == 0 ? nil : words[0]
  else
    words.size.odd? ? words[middle] : [words[middle - 1], words[middle]]
  end
end

p penultimate_fe('last word')
p penultimate_fe('Launch School is great!')
p penultimate_fe('Launch School is SO great!')