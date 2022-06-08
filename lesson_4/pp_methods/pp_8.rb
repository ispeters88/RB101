# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

## Answer ##
# >> Array#take returns the first n elements from the array, where n is the argument passed in to #take
# It is not destructive; we can confirm this within the ruby documentation, where the method signature states:
# take(n) → new_ary
# We can also confirm this by testing it out in a repl session