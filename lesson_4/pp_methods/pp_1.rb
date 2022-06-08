# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

## Answer ##
# >> The Enumerable#select method returns a new collection containing the selected elements. The return
# value in this case is [1, 2, 3]; even though none of the items in the original collection meet the { num > 5 } criterion, 
# the return value for each block is "hi" which is truthy