# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# 1.

puts 'Four score and ' + famous_words

# 2.

puts "Four score and #{famous_words}"

# 3.

famous_words.prepend('Four score and ')
puts famous_words