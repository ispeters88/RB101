# Greeting a user


# Write a program that will ask for user's name. 
# The program will then greet the user. If the user writes "name!" then the computer yells back to the user.



## Examples ##

=begin 
1) 

What is your name? Bob
Hello Bob.

2) 
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
=end

puts "What is your name"
input = gets.chomp

if input[-1] == '!'
  # intiial
  #puts "HELLO #{input.chop.upcase}. WHY ARE WE SCREAMING?"
  # Further exploration
  puts "HELLO #{input.chomp!('!').upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{input}"
end