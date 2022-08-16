# Unique In Order

## Problem Statement ##
# Implement the function unique_in_order which takes as argument a sequence 
# and returns a list of items without any elements with the same value next to each other 
# and preserving the original order of elements.

## Problem ##
# input - sequence (string or array)
# output - array
# rules/reqs
#   1) input can be either a string or an array
#   2) 

require "pry-byebug"

def unique_in_order(seq)
  if seq.class == Array
    #binding.pry
    seq.delete_if.with_index { |ele, idx| seq[idx+1] == ele }
  else
    seq.scan(/(\w)\1*/).flatten
  end
end


p unique_in_order([1, 2, 3, 3])
p unique_in_order(["a", "b"])
p unique_in_order(["a", "a", "a", "b", "b"])



def unique_in_order_chunky(iterable)
  binding.pry
  (iterable.is_a?(String) ? iterable.chars : iterable).chunk { |x| x }.map(&:first)
end

p unique_in_order_chunky(["a", "a", "a", "b", "b"])

## Examples ##

## Data/Algorithm ##
# primary question - how to accomodate both strings and arrays? 
#     > could do a check for the object class
# > For a sequence, seq:
#     1) normalize the sequence to an intermediary string value
#     2) locate all consecutive duplicate values, and add the first of each consecutive sequence to an array
#     3) return the array