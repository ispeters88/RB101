# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. 
# The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

## Problem ##
# input - array
# output - new array
# rules/reqs
#   1) output array should be a different object than the input array. Don't modify input array
#   2) cannot use Array#rotate or Array#rotate!
#   3) move first element to end of array, shift all values up accordingly

def rotate_array_v1(arr)
  new_arr = Array.new

  arr.each_with_index do |val, idx|
    if idx == 0
      new_arr[arr.size - 1] = val
    else
      new_arr[idx - 1] = val
    end
  end

  new_arr
end

def rotate_array(arr)
  new_arr = arr.clone
  new_arr[arr.size - 1] = new_arr.shift
  new_arr
end

def rotate_array_multiple(arr, repeat=1)
  new_arr = arr.clone
  repeat.times { new_arr[arr.size - 1] = new_arr.shift }
  new_arr
end


## Examples ##
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_array_multiple([7, 3, 5, 2, 9, 1], 6)

## Data/Algorithm ##
# > Given an array, arr - 
#     1) Initialize an empty array, new_arr
#     2) Iterate over the elements in arr (original array). For each element:
#         2a) if the index position of the element in arr is 0, set that element as the value at index position
#             (size of arr - 1) within new_arr
#         2b) Otherwise, set the element as the value at index position (index - 1) within new_arr, where *index*
#             is its index position within arr


## Further Exploration ##
# Write a method that rotates a string instead of an array. 
# Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_string("This is a test of a string")
p rotate_integer(123456789)