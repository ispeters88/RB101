# Combining Arrays

# Write a method that takes two Arrays as arguments, 
# and returns an Array that contains all of the values from the argument Arrays. 
# There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.


def merge(arr1, arr2)
  (arr1 + arr2).uniq
end


## Example ##
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

## much simpler LS solution with clear math ties ##

def merge_union(arr1, arr2)
  arr1.union(arr2)
end

p merge_union([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]