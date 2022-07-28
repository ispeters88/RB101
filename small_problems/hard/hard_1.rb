# Madlibs Revisited

# Let's build another program using madlibs. We made a program like this in the easy exercises. 
# This time, the requirements are a bit different.
# 
# Make a madlibs program that reads in some text from a text file that you have created, 
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 
# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, 
# but the text data should come from a file or other external source. 
# Your program should read this text, and for each line, 
# it should place random words of the appropriate types into the text, and print the result.

require "pry-byebug"

ADJS = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADVERBS = %w(easily lazily noisily excitedly)

WORDS = { "%{adjective}" => ADJS, "%{noun}" => NOUNS, "%{verb}" => VERBS, "%{adverb}" => ADVERBS }

def madlibs(file)
  txt = ''
  tags = Regexp.union(WORDS.keys)

  File.foreach(file) do |line|
   txt << line.split.map do |word|
            word_no_punct = word.delete(",:;?!.")
            WORDS.key?(word_no_punct) ? word.gsub(tags,WORDS[word_no_punct].sample) : word
          end.join(' ') + ' '
        end
  p txt
end

madlibs("madlibs_ex.txt")



## Data/Algorithm ##
# > Given a text file, file -
#     1) Open the file for reading and read in each line
#     2) Split each line by whitespace
#     3) replace any #{} tags we have defined, with a random sample from the list associated with that tag
#     4) print out each line with replacements done



## LS solution - for future reference on Kernel#format ##


def madlibs_ls(file)
  File.open(file) do |file|
    file.each do |line|
      puts format(line, noun:       NOUNS.sample,
                        verb:       VERBS.sample,
                        adjective:  ADJS.sample,
                        adverb:     ADVERBS.sample)
    end
  end
end

madlibs_ls("madlibs_ex.txt")