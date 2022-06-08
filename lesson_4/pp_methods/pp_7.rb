# What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

## Answer ##
# >> The block's return value is determined by the last line in the block - in this case, it is a boolean value
# based on whether the number for each block iteration is odd (true) or even (false)
# The return value of any? is a boolean value; in this case, it is true - because there is at least 1 item in the 
# collection that is odd
# Output is 1