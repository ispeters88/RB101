# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# >> This time, the object_id value is the same for all three variables. The difference here is that we are 
# pointing a and b towards the same *numeric* value 42, which has a set memory location. This is in contrast
# to "equal" strings, which can reside in different locations in memory