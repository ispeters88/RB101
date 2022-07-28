# Reverse Sentence

# The reverse_sentence method should return a new string with the words of its argument in reverse order, 
# without using any of Ruby's built-in reverse methods. 
# However, the code below raises an error. Change it so that it behaves as expected.

## ORIGINAL CODE ##

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'


## NEW CODE ##
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.prepend(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'


## EXPLANATION ##
# > can't use the array concatenation method (+) to combine a string with an array - has to be two arrays
# my fix involved abandoning concat entirely. LS suggested solution sticks with concat, by turning word[i] into an array first:

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [word[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end