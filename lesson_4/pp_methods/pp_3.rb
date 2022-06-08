# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

## Answer ##
# >> The return value is a new array containing the items that return false for the passed in block (ie the items that
# were not "rejected")
# The return value in this case is [1, 2, 3], since the return value of the block at each pass (the last value) is nil (the
# return value of a puts statement). 