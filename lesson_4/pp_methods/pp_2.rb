# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

## Answer ##
# >> We can find out using the ruby documentation. 
# The documentation for Array#count indicates that it returns an integer representing the number of items in the
# collection - either the total number, if no argument is passed to count, or the number of items matching the
# argument or block value passed to #count
# >> In this example, only those items for which the given block returns true, are counted. The return value is 2