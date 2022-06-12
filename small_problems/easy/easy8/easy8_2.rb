# Madlibs

# Mad libs are a simple game where you create a story template with blanks for words. 
# You, or another player, then construct a list of words and place them into the story, 
# creating an often silly or funny story as a result.
# 
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
# and an adjective and injects those into a story that you create.

def prompt(msg)
  puts "=> #{msg}"
end

def get_noun
  prompt "Enter a noun: "
  gets.chomp.downcase
end

def get_verb
  prompt "Enter a verb: "
  gets.chomp.downcase
end

def get_adj
  prompt "Enter an adjective: "
  gets.chomp.downcase
end

def get_adverb
  prompt "Enter an adverb: "
  gets.chomp.downcase
end

def mad_lib
  noun = get_noun
  verb = get_verb
  adjective = get_adj
  adverb = get_adverb
  prompt "Why would you #{verb} the #{noun} in such a #{adverb} #{adjective} way? That is crazy!"
end

mad_lib

## Example ##
=begin
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
=end