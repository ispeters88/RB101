# Getting Things Done
# 
# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, 
# but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?


## ORIGINAL CODE ##
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

#move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

## NEW CODE ##
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

## EXPLANATION ##
# > there was no base case defined. When the input value of n has been reduced to 0, we should stop recursion


## Further Exploration ##
# What happens if the length of the from_array is smaller than n?

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)

# >> We will add nil values to the to_array once we have passed the size of from_array in recursive calls

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']