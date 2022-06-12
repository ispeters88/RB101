# Reversed Arrays (Part 2)

# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. 
# Do not modify the original list.
# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

=begin
def reverse(arr)
  new_arr = Array.new
  arr.size.times do |idx|
    new_arr[idx] = arr[-idx - 1]
  end
  new_arr
end



## Examples ##

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true



## ls solution ##
def reverse_ls(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

=end

## Further Exploration ##

require "pry-byebug"

def reverse_inject(arr)
  arr.inject([]) { |list, item| list.unshift(item) }
end

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse_inject(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id

def reverse_each_with_object(arr)
  arr.each_with_object([]) { |item, list| list.unshift(item) }
end

p reverse_each_with_object([1,2,3,4]) == [4,3,2,1]          # => true
p reverse_each_with_object(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse_each_with_object(['abc']) == ['abc']              # => true
p reverse_each_with_object([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse_each_with_object(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true