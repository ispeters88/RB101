# Odd Lists

# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 
# The values in the returned list should be those values that are in the 
# 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(arr)
  odd_arr = Array.new(0)
  arr.each_with_index { |ele, idx| odd_arr << ele if idx.even? }
  odd_arr
end

def oddities_2(arr)
  odd_arr = Array.new(0)
  arr.each_index { |idx| odd_arr << arr[idx] if idx.even? }
  odd_arr
end

## Examples ##

p oddities([2, 3, 4, 5, 6])  == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p oddities_2([2, 3, 4, 5, 6])

# further exploration
# > companion method

def evenities(arr)
  even_arr = Array.new(0)
  arr.each_index { |idx| even_arr << arr[idx] if idx.odd? }
  even_arr
end

def evenities_while(arr)
  even_arr = Array.new(0)
  idx = 1
  while idx < arr.size
    even_arr << arr[idx]
    idx += 2
  end
  even_arr
end

p evenities_while([1, 2, 3, 4, 5, 6])
p evenities([1, 2, 3, 4, 5, 6])