# Multiply Lists

# Write a method that takes two Array arguments in which each Array contains a list of numbers, 
# and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. 
# You may assume that the arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  product_arr = Array.new

  arr1.each_with_index do |num, idx|
    product_arr << num * arr2[idx]
  end

  product_arr
end



## Example ##
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


## Further Exploration ##
# The Array#zip method can be used to produce an extremely compact solution to this method. 
# Read the documentation for zip, and see if you can come up with a one line solution (not counting the def and end lines).


def multiply_list_fe(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.inject(&:*) }
end

p multiply_list_fe([3, 5, 7], [9, 10, 11]) == [27, 50, 77]