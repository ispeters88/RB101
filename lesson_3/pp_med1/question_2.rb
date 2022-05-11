# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# >> We are attempting to use the String#+ method but the second operand is a numerical value (42)
# Possible solutions:

# 1)
puts "the value of 40 + 2 is " + (40 + 2).to_s

# 2)
puts "the value of 40 + 2 is #{40 + 2}"