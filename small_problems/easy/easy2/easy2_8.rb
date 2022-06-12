# Sum or Product of Consecutive Integers

# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

## Examples ##

=begin

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

def prompt(msg)
  puts ">> #{msg}"
end

result = nil
operation = ''
number = 1
operations = { 's' => 'sum', 'p' => 'product' }

loop do

  prompt "Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if operation == 's' || operation == 'p'
  puts "That is not a valid operation; please try again"

end

numbers = (1..number).to_a

if operation == 's'
  result = numbers.inject(:+)
elsif operation == 'p'
  result = numbers.inject(:*)
end

puts operations
puts "The #{operations[operation]} of the integers between 1 and #{number} is #{result}"