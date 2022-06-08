# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

## Answer ##
# >> The return value of Enumerable#each_with_object is the object represented by the argument passed in to the
# #each_with_object method. In this case the return value is a hash. In particular:
# { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }