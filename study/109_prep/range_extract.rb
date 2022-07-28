# Range Extraction


# A format for expressing an ordered list of integers is to use a comma separated list of either
# individual integers or a range of integers denoted by the starting integer separated from the 
# end integer in the range by a dash, '-'. The range includes all integers in the interval including both endpoints. 
# It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"
# Complete the solution so that it takes a list of integers in increasing order 
# and returns a correctly formatted string in the range format.

## Problem ##
# input - array of integers
# output - string (see rules)
# rules/reqs -
#   1) input array is sorted low > high
#   2) output string should contain integers separated by either commas or by (-). (-)) for consecutive sequences of integers,
#      commas otherwise
# questions - 

require "pry-byebug"

def extract_range(nums)
  result = String.new
  temp = Array.new
  final = nums.size - 1
  #binding.pry

  nums.each.with_index do |num, idx|
    break if idx == final - 1
    if (num + 1 == nums[idx + 1]) || (num == nums[idx - 1] + 1)
      temp << num.to_s
    else
      result << "#{temp.first}-#{temp.last}" unless temp.empty?
      temp.clear
      result << num.to_s
    end
  end

  result << (temp.empty? ? nums.last.to_s : "#{temp.first}-#{temp.last}")
  result
end


def extract_range_sand(nums)
  result = String.new
  extract = Array.new

  extract = nums.select do |num|
    
end



## Examples ##
p extract_range_sand([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
# returns "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"


## Data/Alg ##
# > Given an array of integers sorted low > high, nums - 
#     1) initialize a local variable, result, pointing to an empty String object
#     2) initialize a local variable, extract, pointing to an empty Array object
#     3) iterate over nums; on each iteration:
#         > check if the current value in nums is equal to the previous value in nums + 1, and to the next value - 1. If so
#           filter the current value out of 

=begin
if !temp.empty? && num == temp.last + 1
  temp << num.to_s
else
  result << "#{temp.first}-#{temp.last}"
  temp.clear
  result << num.to_s
end
=end