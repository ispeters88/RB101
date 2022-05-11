# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

=begin
what is != and where should you use it?
put ! before something, like !user_name
put ! after something, like words.uniq!
put ? before something
put ? after something
put !! before something, like !!user_name

=end

# >> ! is used to flip the boolean value associated to an expression, and 
#    to indicate that a method mutates the caller

=begin

what is != and where should you use it?
  != is the comparison operator for "not equal to"

put ! before something, like !user_name
  this will flip the boolean value; for any "something" other than false and nil, this will result in a false value
  doing this on false or nil will return a true value

put ! after something, like words.uniq!
  this is commonly used in method naming to indicate that the method is destructive/mutating

put ? before something
  This can indicate use of the ternary operator ?:

put ? after something
  this is commonly used in method naming to indicate that the method will return a boolean value (true/false), or 
  an object representing a true value

put !! before something, like !!user_name
  flips the boolean value twice; for any "something" other than false and nil, this will result in a true value
  doing this on false or nil will return a false value

=end