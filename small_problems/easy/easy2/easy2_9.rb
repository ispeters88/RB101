# String Assignment

# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.



## Answer ##
# > 'Alice', 'Bob'

# Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?


## Answer 2 ##
# > 'BOB', 'BOB"'
# The #upcase! method mutates the original string (whereas the reassignment in the first example created a new string)