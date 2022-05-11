=begin

Every object in Ruby has access to a method called object_id, 
which returns a numerical value that uniquely identifies the object. 
This method can be used to determine whether two variables are pointing to the same object.

Take a look at the following code and predict the output:

=end

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# >> This outputs the same value for a.object_id and c.object_id, as they are pointing to the same location
# in memory. b.object_id has a different value - even though the value pointed to by a and b are equal, they
# are in different locations in memory