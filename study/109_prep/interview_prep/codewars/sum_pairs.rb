# Sum of pairs

# Given a list of integers and a single sum value, return the first two values (parse from the left please) 
# in order of appearance that add up to form the sum.
# 
# Negative numbers and duplicate numbers can and will appear.
# 
# NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. Be sure your code doesn't time out.


## problem ##
# input - 1) array, 2) number
# output - array
# rules/reqs
#   1) output array should have exactly 2 elements
#   2) input array can contain negative numbers and repetition of elements can occur
#   3) return nil if there is no such pair

def sum_pairs_bsearch(arr, total)
  i, end_idx = 1, arr.size
  
  loop do
    temp = arr[0...i].sort
    maybe_solution = temp.bsearch do |num|
                       total <=> arr[i] + num
                     end
    return [maybe_solution, arr[i]] unless maybe_solution == nil
    i += 1
    break if i == end_idx
  end
end

def sum_pairs_loop(arr, total)
  i, end_idx = 0, arr.size
  possible_solutions = Hash.new

  loop do
    return [possible_solutions[arr[i]], arr[i]] if possible_solutions[arr[i]]
    possible_solutions[total - arr[i]] = arr[i]
    i += 1
    break if i == end_idx
  end
end

def sum_pairs(arr, total)
  possible_solutions = Hash.new
  arr.each do |num|
    return [possible_solutions[num], num] if possible_solutions[num]
    possible_solutions[total - num] = num
  end
  nil
end



## examples ##
p sum_pairs([1, 4, 8, 7, 3, 15], 8)
p sum_pairs([1, -2, 3, 0, -6, 1], -6)
p sum_pairs([20, -13, 40], -7)
p sum_pairs([1, 2, 3, 4, 1, 0], 2)
p sum_pairs([10, 5, 2, 3, 7, 5], 10)
p sum_pairs([5, 9, 13, -3], 10)
p sum_pairs([4, -2, 3, 3, 4], 8)

## algorithm ##
# Initialize a local var possible_solutions to an empty Hash object
# Iterate over the input array, with index position available
#   > Do a binary search for elements that are equal to the input sum less the element
#   > If one is found, return [found_val, current_iter_val
# If iteration ends with no return value, return nil