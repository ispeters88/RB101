# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

## Answer ##
# >> The return value is 11.
# The Array#pop method removes the last item in the array and returns it
# This value, 'caterpillar', is then passed into the #size method (via method chaining).
# 'caterpillar'.size returns the number of characters in 'caterpillar' -> 11