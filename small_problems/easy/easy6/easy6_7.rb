# Halvsies

# Write a method that takes an Array as an argument, 
# and returns two Arrays (as a pair of nested Arrays) 
# that contain the first half and second half of the original Array, respectively. 
# If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(arr)
  new_arr = Array.new(2) { Array.new }
  arr.each_with_index do |item, idx|
    idx < arr.size / 2.0 ? new_arr[0] << item : new_arr[1] << item
  end
  new_arr
end



## Examples ##
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

def halvsies_reader_friendly(arr)
  first_half, second_half = Array.new(2) { Array.new }
  arr.each_with_index do |item, idx|
    idx < arr.size / 2.0 ? first_half << item : second_half << item
  end
  [first_half, second_half]
end

p halvsies_reader_friendly([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies_reader_friendly([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies_reader_friendly([5]) == [[5], []]
p halvsies_reader_friendly([]) == [[], []]