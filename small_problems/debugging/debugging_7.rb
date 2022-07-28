# Neutralizer
# 
# We wrote a neutralize method that removes negative words from sentences. 
# However, it fails to remove all of them. What exactly happens?

## ORIGINAL CODE ##
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

## NEW CODE ##
def neutralize(sentence)
  words = sentence.split(' ')
  words.delete_if { |word| negative?(word) }

  words.join(' ')
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

## EXPLANATION ##
# in the original code, we were deleting values from an array while iterating over it. That will produce unintended results