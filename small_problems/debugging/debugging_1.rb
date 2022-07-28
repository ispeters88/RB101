# Countdown
# 
# Our countdown to launch isn't behaving as expected. Why? 
# Change the code so that our program successfully counts down from 10 to 1.

##  ORIGINAL CODE ##

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

## NEW CODE ##

counter = 10
10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

## OR ##
counter = 10
10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

## Explanation ##
# > In the main body of the program, we are not storing off the result of the decrease method. The counter is iterated down
# within that method, but that doesn't affect the value in the next iteration of Integer#times

## Further Exploration ##
# We specify 10 two times, which looks a bit redundant. 
# It should be possible to specify it only once. Can you refactor the code accordingly?

counter = 10
until counter == 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'