# Bubble Sort


# Bubble Sort is one of the simplest sorting algorithms available. 
# It isn't an efficient algorithm, but it's a great exercise for student developers. 
# In this exercise, you will write a method that does a bubble sort of an Array.
# 
# A bubble sort works by making multiple passes (iterations) through the Array. 
# On each pass, each pair of consecutive elements is compared. 
# If the first of the two elements is greater than the second, then the two elements are swapped. 
# This process is repeated until a complete pass is made without performing any swaps; at that point, 
# the Array is completely sorted.
# 
# We can stop iterating the first time we make a pass through the array without making any swaps; at that point, 
# the entire Array is sorted.
# 
# For further information, including pseudo-code that demonstrates the algorithm 
# as well as a minor optimization technique, see the Bubble Sort wikipedia page.
# 
# Write a method that takes an Array as an argument, and sorts that Array 
# using the bubble sort algorithm as just described. Note that your sort will be "in-place"; 
# that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

## Problem ##
# input - array
# output - array (same)
# rules/reqs
#   1) output array should be the same object as the input array (mutate the input)
#   2) input will contain at least 2 elements


def bubble_sort!(arr)
  loop do
    swapped = false
    (1...arr.size).each do |idx|
      if arr[idx] < arr[idx - 1]
        temp = arr[idx - 1]
        arr[idx - 1] = arr[idx]
        arr[idx] = temp
        swapped = true
      end
    end
    break if swapped == false
  end
  arr
end


## Examples ##
=begin
p array = [5, 3]
p array.object_id
bubble_sort!(array)
p array# == [3, 5]
p array.object_id

p array = [6, 2, 7, 1, 4]
p array.object_id
bubble_sort!(array)
p array# == [1, 2, 4, 6, 7]
p array.object_id

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p array.object_id
bubble_sort!(array)
p array# == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p array.object_id
=end

## Data/Algorithm ##
# > Given an array, arr - 
#     1) initialize a variable swapped, and set to false
#     2) Iterate over arr[1..size of arr]
#         > On each iteration, check if the value of arr at the current index is less than the value at the current index - 1
#         > If so, set variable temp to the value at current index - 1
#         > Then set value at current index - 1 to value at the current index
#         > Finally set value at current index to temp


# pseudocode from wiki:
=begin

procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n-1 inclusive do
            /* if this pair is out of order */
            if A[i-1] > A[i] then
                /* swap them and remember something changed */
                swap(A[i-1], A[i])
                swapped := true
            end if
        end for
    until not swapped
end procedure

=end

#optimizing
=begin

procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        newn := 0
        for i := 1 to n - 1 inclusive do
            if A[i - 1] > A[i] then
                swap(A[i - 1], A[i])
                newn := i
            end if
        end for
        n := newn
    until n ≤ 1
end procedure

=end

def bubble_sort_opt!(arr)
  size = arr.size
  loop do
    new_size = 0
    (1..size - 1).each do |i|
      if arr[i] < arr[i - 1]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        new_size = i
      end
    end
    size = new_size
    break if size <= 2
  end
end

## Examples ##
p array = [5, 3]
p array.object_id
bubble_sort_opt!(array)
p array# == [3, 5]
p array.object_id

p array = [6, 2, 7, 1, 4]
p array.object_id
bubble_sort_opt!(array)
p array# == [1, 2, 4, 6, 7]
p array.object_id

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p array.object_id
bubble_sort_opt!(array)
p array# == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p array.object_id