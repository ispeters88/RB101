# 4. (part 4, first problem)
# * 16:57 * 

=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence of an array of integers.
Easy case is when input array is all positive, then return total sum of array. 
If total array is made up of only negative numbers, return 0 instead. 
Empty array assumed to have 0 greatest sum. Note the empty array is also a valid subarray. 
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([]) == 0 
max_sequence([11] == 11
max_sequence([-32] == 0 
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4] == 12
=end 



## problem & data structures ##
# input - array
# output - integer
# rules/reqs
#   1) input array contains integers - can be positive or negative
#   2) output should be the greatest possible sum of all possible subsequences
#   3) for empty input array, return 0. For all negative values, return 0

require "pry-byebug"

def find_all_subseqs(array)
  subseq_start, end_index = 0, array.size
  all_subseqs = Array.new

  loop do
    subseq_end = subseq_start

    loop do
      break if subseq_end == end_index
      all_subseqs << array[subseq_start..subseq_end]
      subseq_end += 1
    end

    break if subseq_start == end_index
    subseq_start += 1
  end

  all_subseqs

end


def max_sequence(array)
  return 0 if array.empty? || array.all? { |num| num < 0 }
  all_subs = find_all_subseqs(array)

  all_subs.map(&:sum).max
end


## examples ##
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])# == 6
p max_sequence([])# == 0 
p max_sequence([11])# == 11
p max_sequence([-32])# == 0 
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])# == 12

## algorithm ##
# Find all contiguous subsequences of input array
# Calculate sum of each subsequence
# Take maximum value of sums; if value is < 0, return 0; otherwise, return max sum
