# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# [1, 2, 2, 3]
# Array#uniq returns a new array; it does not mutate the calling array. 
# We would need to use Array#uniq! to mutate the calling array