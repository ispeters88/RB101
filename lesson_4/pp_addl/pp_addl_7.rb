# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

freq_hash = Hash.new(0)

def make_freq_hash(str, result_hash)
  str.each_char { |char| result_hash[char] += 1 if char != ' ' }
  result_hash
end

puts make_freq_hash(statement, freq_hash)


=begin 
the LS supplied solution utilizes the #count method, by iterating over every single letter in the alphabet. This means
we are doing 52 iterations, which may or may not be more/less optimized depending on the length of the input string

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

=begin