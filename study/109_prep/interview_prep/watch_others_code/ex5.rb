# 5. (part 3, second problem)
# * 11:44 *
=begin
Write a method to find the longest common prefix string amongst an array of strings
If no common prefix, return empty string.
All given inputs are in lowercase letters a-z.
p common_prefix(%w(flower, flow, flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'
=end 




## problem & data structures ##
# input - array
# output - string
# rules/reqs
#   1) input array contains strings
#   2) all strings in array contain lowercase letters a-z only
#   3) output string should be the maximum character substring that all strings in the input array share as prefixes

def common_prefix(words)
  prefix = words.sort_by(&:length).last

  loop do
    return prefix if words.all? { |word| word.start_with?(prefix) }
    prefix.slice!(prefix.length-1...prefix.length)
    break if prefix.length == 0
  end

  prefix
end


## examples ##
p common_prefix(%w(flower flow flight))# == 'fl'
p common_prefix(%w(dog racecar car))# == ''
p common_prefix(%w(interspecies interstellar interstate))# == 'inters'
p common_prefix(%w(throne dungeon))# == ''
p common_prefix(%w(throne throne))# == 'throne'

## algorithm ##
# Iterate over the possible prefixes in the longest (or tied for longest) string in the input array
#   > Start with the longest prefix - (the string itself)
#   > on each iteration, check if all the other stirngs in the input array start with the current iteration prefix
#   > if so, return it
#   > otherwise, remove the last character and repeat
# Return the remaining value of the prefix

