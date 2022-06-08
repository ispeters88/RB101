# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# >> The #map method returns an array containing the return value of each iteration of the block.
# In this case, the return value is [nil, 'bear']