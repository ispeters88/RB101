=begin
>> seems like this works
def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end
=end

=begin

>> this one returns the array of words from String#split. The #Array#each method takes action on the array via the block,
>> but its final return value is the original array itself.

def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end
=end

=begin
>> On this one we don't throw a NoMethodError because we never run the while loop for nil strings; we do for option #4

def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end
=end

=begin
>> This iterates incorrectly. It only goes up to the n-1 item, where n is the size of the array

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1
  puts strings.size

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end
=end

p string_lengths("this is a test of a regular sentence")
p string_lengths("singlewordtest")
puts "this is a test of nil: "
p string_lengths("")
p string_lengths("this is a test, using punctuation!")