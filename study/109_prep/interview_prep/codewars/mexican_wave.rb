# Mexican Wave
#  * 40:38 *
# got stuck for too long on trivial details - in particular, spent way too long figuring out that rb 2.5 does not support
# string[index..] as syntactic sugar for 'through the end of the string'. Had to change to string[index...string.length]
# to get the code to even pass initial syntax checking. After that, hit a minor snag with the whitespace carveout rule,
# but fairly quickly found a way around that using the next keyword


# The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal 
# rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. 
# Immediately upon stretching to full height, the spectator returns to the usual seated position.
# 
# The result is a wave of standing spectators that travels through the crowd, even though individual spectators 
# never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way 
# around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, 
# the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, 
# the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, 
# although simultaneous, counter-rotating waves have been produced. 
# 
# Task
# 
# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
# You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up. 
# 
# Rules
# 
# 
# 1.  The input string will always be lower case but maybe empty.
# 
# 2.  If the character in the string is whitespace then pass over it as if it was an empty seat
# 


## problem & data structures ##
# input - string
# output - array 
# goal
#   > "ripple" the effect of uppercasing letters through the stirng
#   > upcase the char @ pos 0, then repeat with position 1, and so forth to the end.
# rules/reqs
#   > input string will be all downcase
#   > input string can be empty
#   > whitepsace may exist and should be ignored for the purpose of character transformation
#   > only one letter gets upcased at a time.


require "pry-byebug"

def wave(string)
  sequence = Array.new
  len = string.length

  string.chars.each_with_index do |char, idx|
    next if char.match?(/\W/)
    sequence << string[0...idx] + char.upcase + string[idx+1...len]
  end

  sequence
end

## examples ##
p wave("hello")# => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

## algorithm ##
# Initialize a local var sequence to an empty Array object
# Iterate over the values from 0 to string length (non inclusive), with iterator variable i
#     > upcase the ith value in the input string and push the resulting string to sequence

# ** in order to skip whitespace
#   > use next when current character is /\W/

# after iteration is complete, return the sequence array

