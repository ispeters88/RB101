# How old is Teddy?

# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# puts "Teddy is #{rand(20..200)} years old!"

## Examples ##
# Teddy is 69 years old!

# Further exploration

def your_age(name)
  puts "#{name} is #{rand(20..200)} years old!"
end

puts "What is your name?"
input = gets.chomp
name = (input == '' ? "Teddy" : input)
your_age(name)