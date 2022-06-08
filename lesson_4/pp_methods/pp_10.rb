# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

## Answer ##
# >> [1, nil, nil]
# The #map method returns an array containing the return value of each iteration through the supplied block
# The first item fails the if condition, so the return value is the item itself.
# The 2nd and 3rd items pass the if condition, in which case the puts statement is exectued. The return value of this 
# statement is nil