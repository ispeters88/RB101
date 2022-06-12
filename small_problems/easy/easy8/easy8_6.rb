# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".



def fizzbuzz(x, y)
  nums = (x..y).to_a
  nums.map! do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 ==0 || num % 5 == 0
      num % 3 == 0 ? "Fizz" : "Buzz"
    else
      num
    end
  end
  
  p nums.join(', ')
end


## Examples ##

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


## Data/Algorithm ##
# > Given two numbers, x and y - 
#     1) Iterate over all numbers between x and y (inclusive)
#     2) add each number to an array
#     3) Iterate over array and replace numbers as follows:
#         3a) if divisible by 3 and 5, replace w/ "FizzBuzz"
#         3b) if divisible by 3, replace with "Fizz"
#         3c) if divisible by 5, replace with "Buzz"

