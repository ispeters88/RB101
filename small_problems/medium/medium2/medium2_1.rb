# Longest Sentence

# Write a program that reads the content of a text file and then prints the longest sentence 
# in the file based on number of words. 
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
# You should also print the number of words in the longest sentence.

def import_file(file)
  text = ''
  File.foreach(file) do |line|
    text << line.gsub(/\n/," ")
  end
  text
end

def longest_sentence(txt_file)
  text = import_file(txt_file)
  sentences = text.scan(/[^.!?]+[.!?]/).map { |sent| sent.lstrip }

  longest = Array.new
  sentences.each do |sentence|
    current = sentence.split(" ")
    longest = current if current.size > longest.size
  end

  puts "Longest sentence is:\n#{longest.join(' ')}"
  puts
  puts "There are #{longest.size} words in this sentence"

end

## Example ##

#longest_sentence("gettysburg.txt")
#longest_sentence("frankenstein.txt")


## Data/Algorithm ##
# > Given a text file, txt_file
#     1) Open the file for reading and pull in the text
#     2) Iterate through the text, separating out each subtring delimited by (.), (!), or (?)


## Further Exploration ##
# You may have noticed that our solution fails to print the period at the end of the sentence. 
# Can you write a solution that keeps the period printed at the end of each sentence?
# 
# > Already done in my solution


#
# What about finding the longest paragraph or longest word? How would we go about solving that problem?
# > 

def longest_word(txt_file)
  words = File.read(txt_file).split(/\W/)
  longest = words.max_by { |word| word.length }
  puts "The longest word, with #{longest.length} letters, is #{longest}"
end

longest_word("gettysburg.txt")
longest_word("frankenstein.txt")

def longest_paragraph(txt_file)
  paragraphs = File.read(txt_file).split(/\n{2}/).map { |para| para.gsub("\n", " ") }
  longest = paragraphs.max_by { |word| word.size }
  words_in_longest = longest.split(/\W/).size
  puts "Longest paragraph has #{words_in_longest} words, and goes as follows:\n#{longest}"
end

longest_paragraph("gettysburg.txt")
longest_paragraph("frankenstein.txt")