# Merge Sort

=begin
Sort an array of passed in values using merge sort. 
You can assume that this array may contain only one type of data. 
And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, 
then recombining those nested sub-arrays in sorted order. It is best shown by example. 
For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested sub-arrays:


[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]
=end


require "pry-byebug"

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(arr)
  size = arr.size
  return arr if size == 1

  arr1 = merge_sort(arr[0...size/2])
  arr2 = merge_sort(arr[size/2..])

  merge(arr1, arr2)
end

def merge_sort_nonrec(arr)
  size = arr.size
  split_arr = arr.map { |val| Array.new(1, val) }

  loop do
    temp = Array.new
    final = split_arr.size - 1
    #binding.pry
    split_arr.each_with_index do |val, idx|
      temp << merge(val, split_arr[idx + 1]) unless idx.odd? || idx == final
    end

    temp << split_arr[final] if final.even?

    split_arr = temp
    break if split_arr.size == 1
  end

  split_arr.first
end

def merge_sort_nonrec_v2(arr)
  split_arr = arr.map { |val| Array.new(1, val) }
  
  while split_arr.size > 1
    split_arr = split_arr.each_slice(2).with_object([]) do |slice, temp|
      temp << (slice.size == 1 ? slice.first : merge(slice.first, slice.last))
    end
  end

  split_arr
end


## Examples ##
#p merge_sort([9, 5, 7, 1])# == [1, 5, 7, 9]
#p merge_sort([5, 3])# == [3, 5]
# p merge_sort([6, 2, 7, 1, 4])# == [1, 2, 4, 6, 7]
#p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))# == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
#p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])# == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

p merge_sort_nonrec_v2([9, 5, 7, 1])
p merge_sort_nonrec_v2([6, 2, 7, 1, 4])
p merge_sort_nonrec_v2([5, 3])# == [3, 5]
p merge_sort_nonrec_v2(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))# == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

## Data/Algorithm ##


## note - can convert all elements to 1-item arrays with this line
#     arr.map { |val| Array.new(1, val) }
## note - this also works, but the ruby docs note that no guarantee is made about order being maintained
#     arr.combination(1).to_a


## Further Exploration ##
# Every recursive algorithm can be reworked as a non-recursive algorithm. 
# Can you write a method that performs a non-recursive merge sort?


## Data/Algorithm ##
# > Given an array, arr - 
#     1) convert arr into a new array <split_arr> where each element is a 1-item array containing the corresponding element from the original array
#     2) initialize an empty array, <result>
#     3) iterate:
#         > on first iteration, use first_iter logic (see below)
#         > otherwise, take next 2 elements of split_arr, feed them into merge, and add return value to result array
#         > reassign value of split_arr as result array
#         > break when size of split_arr array is 1
