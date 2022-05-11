# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# >> deletes the value 2 from the numbers array, since this is at the index 1 that is sent as an argument to the
#    Array#delete_at method
# numbers = [1, 3, 4, 5]
# Array#delete_at returns the value deleted, or nil if the index is out of range

numbers.delete(1)
# >>  deletes the value 1 from the numbers array
# numbers = [2, 3, 4, 5]
# Array#delete returns the last value deleted (it can delete multiple values), or nil if the calling argument is not found