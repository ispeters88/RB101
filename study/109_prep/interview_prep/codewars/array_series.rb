# Minimize Sum Of Array (Array Series #1)

# Given an array of integers , Find the minimum sum which is obtained from summing each Two integers product .


## Problem ## 
# input - array
# output - number
# rules/reqs
#   1) output value should be the sum value of the product of each pair of integers from the input array
#   2) 

require "pry-byebug"

def min_sum(arr)
  arr_sorted = arr.sort
  sum = 0

  loop do
    return sum if arr_sorted.size == 0
    sum += arr_sorted.shift * arr_sorted.pop
  end
end


## Examples ##
# p min_sum([5,4,2,3])
# p min_sum([12,6,10,26,3,24])
# p min_sum([9,2,8,7,5,4,0,6])
# p min_sum([1,2])
# p min_sum([])

## Algorithm ##

# Sort the input array, then iterate through it, taking the next largest and smallest values each time. Multiply those
# values and add it to a running total

# 1) Initialize a local variable, arr_sorted, and set it equal to the sorted input array
# 2) Initialize a local variable, sum, and set it equal to 0
# 3) Iterate until arr_sorted is empty, alternately removing the first and then the last values, multiplying these together
#    and adding the result to sum

# Product Of Maximums Of Array (Array Series #2)
# 
# Given an array/list [] of integers , Find the product of the k maximal numbers.
# 
# Array/list size is at least 3 .
# 
# Array/list's numbers Will be mixture of positives , negatives and zeros
# 
# Repetition of numbers in the array/list could occur.

## Problem/Data ##
# input - array
# output - integer
# rules/reqs
#   1) size of input array is >= 3
#   2) values can be any integer (+/-/0)
#   3) repetition of values can occur
#   4) output value should be the sum of the highest k numbers.

def max_product(numbers, size)
  numbers.max(size).inject(&:*)
end


## Examples ##

# p max_product([4,3,5], 2) # 20)
# p max_product([10,8,7,9], 3) # 720)
# p max_product([8,6,4,6], 3) # 288)
# p max_product([10,2,3,8,1,10,4], 5) # 9600)
# p max_product([13,12,-27,-302,25,37,133,155,-14], 5) # 247895375)
# p max_product([-4,-27,-15,-6,-1], 2) # 4)
# p max_product([-17,-8,-102,-309], 2) # 136)
# p max_product([10,3,-27,-1], 3) # -30)
# p max_product([14,29,-28,39,-16,-48], 4) # -253344)
# p max_product([1], 1) # 1)


## Algorithm ##
# > Given an array _numbers_ and an integer _k_
# Find the highest k values in the numbers array, and return their collective product

# 1) Use the #max method to return the top k elements as an array
# 2) Call inject with the resulting array from step #1 to get the arithmetic product of the values


# Maximum Product

# Given an array of integers , Find the maximum product obtained from multiplying 2 adjacent numbers in the array.
# 
# Array/list size is at least 2.
# 
# Array/list numbers could be a mixture of positives, negatives also zeroes .

## Problem ##
# input - array of integers
# output - integer
# rules/reqs
#   1) size of input array is >= 2
#   2) items in input array can be any integer (positive/negative/zero)

def adjacent_element_product(arr)
  products = Array.new
  size = arr.size

  arr.each.with_index do |num, idx|
    products << num * arr[idx + 1] unless idx == size - 1
  end

  products.max
end


## Examples ##
# p adjacent_element_product([5, 8])
# p adjacent_element_product([5, 1, 1, 8])
# p adjacent_element_product([1, 2, 3])
# p adjacent_element_product([1, 5, 10, 9])
# p adjacent_element_product([4, 12, 3, 1, 5])

## Algorithm ##
# Create an array containing all 2-item pairs of adjacent values from the input array.
# Iterate over the values in the array, getting the product of each pair of values. Return the maximum of these products

# 1) Initialize a local variable, products, and assign it to an Array object
# 2) Iterate over the values in the input array; on each iteration:
#     > if the value is not the last in the array, calculate the product of the value and the next value. add this
#     > to products
# 3) Calculate and return the maximum value from products


# Note > Many of the short solutions use the each_cons method. For ex:
# array.each_cons(2).map { |a,b| a * b }.max


# Array Leaders (Array Series #3)
# An element is leader if it is greater than The Sum all the elements to its right side.
# Given an array/list [] of integers , Find all the LEADERS in the array.
# 
# Array/list size is at least 3 .
# 
# Array/list's numbers Will be mixture of positives , negatives and zeros
# 
# Repetition of numbers in the array/list could occur.
# 
# Returned Array/list should store the leading numbers in the same order in the original array/list .

## Problem ##
# input
# output
# rules/reqs

def array_leaders(arr)
  result = Array.new
  size = arr.size

  arr.each.with_index do |num, idx|
    next if idx == size - 1
    result << num if num > arr.slice(idx+1..).sum
  end

  result << arr.last if arr.last > 0
  result
end


## Examples ##
# p array_leaders([1, 2, 3, 4, 0]) # [4]
# p array_leaders([16, 17, 4, 3, 5, 2]) # [17, 5, 2]
# p array_leaders([-1, -29, -26, -2]) # [-1]
# p array_leaders([-36, -12, -27]) # [-36, -12]
# p array_leaders([5, -2, 2]) # [5, 2]
# p array_leaders([0, -1, -29, 3, 2]) # [0, -1, 3, 2]

## Algorithm ##

# Create all possible contiguous subarrays of the input array of maximum length, then calculate sum of values within each
# subarray. Iterate over this list of values, and compare the value of each value in the input array against its corresponding
# subarray sum value. Add any that are larger than its corresponding subarray sum value, to a result array.

# 1) Initialize the following local variables:
#     a] result, pointing to array object
#     b] slice_sums, pointing to array object
# 2) Iterate over the values in the input array, with local var idx; on each iteration:
#     > take slice of input array starting from idx + 1 to the end of the array
#     > get the sum of the values in the slice
#     > add that sum to slice_sums
# 3) Iterate over the values in input array, with the index value available. On each iteration:
#     > if the value (num) in the input array is greater than the value at the same index within slice_sums, add num
#       to result
# 4) Return result



# Maximum Gap (Array Series #4)
# Given an array/list [] of integers , Find The maximum difference between the successive elements in its sorted form.
# Array/list size is at least 3 .
# 
# Array/list's numbers Will be mixture of positives and negatives also zeros_
# 
# Repetition of numbers in the array/list could occur.
# 
# The Maximum Gap is computed Regardless the sign.


## Problem ##
# input - array
# output - integer
# rules/reqs
#   1) size of input array >= 3
#   2) values in input array can be any integer (positive/negative/zero)
#   3) output value should be the largest gap of successive elements, after the input array has been sorted
#   4) repetition of values in input array is allowed

def max_gap(arr)
  max = 0
  gaps = arr.size - 1
  arr.sort! { |a, b| b <=> a }
  #binding.pry
  gaps.times do |idx|
    cur_gap = arr[idx] - arr[idx+1]
    max = cur_gap if max < cur_gap
  end

  max
end


## Examples ##
# p max_gap([13,10,2,9,5])
# p max_gap([13,3,5])
# p max_gap([24,299,131,14,26,25])
# p max_gap([-3,-27,-4,-2])
# p max_gap([-7,-42,-809,-14,-12])
# p max_gap([12,-5,-7,0,290])
# p max_gap([-54,37,0,64,-15,640,0])
# p max_gap([130,30,50])

## Algorithm ##
# Sort the input array. Define a local variable max to track the largest gap between two successive values. Iterate over
# the sorted array, checking if the gap between the value and the next value is greater than the current value of max; if it
# is, set max to that value

# 1) Initialize a local variable, max, and set it to 0
# 2) Sort the input array and iterate over it; on each iteration:
#     > find the "gap" between the current value and the next value. If the gap value is greater than the current value
#       of max, set max to the gap value
# 3) return max


# Product Array (Array Series #5)

# Given an array/list [] of integers , 
# Construct a product array Of same size Such That prod[i] is equal to The Product 
# of all the elements of Arr[] except Arr[i].
# 
# Array/list size is at least 2 .
# 
# Array/list's numbers Will be only Positives
# 
# Repetition of numbers in the array/list could occur.


def product_array(arr)
  product = arr.inject(&:*)
  arr.map { |num| product / num }
end


## Problem ##
# input - array
# output - array
# rules/reqs
#   1) input array size is >= 2
#   2) values in input array are > 0
#   3) repetition of values are possible


## Examples ##
# p product_array([12,20]) # [20,12])
# p product_array([12,20]) # [20,12])
# p product_array([3,27,4,2]) # [216,24,162,324])
# p product_array([13,10,5,2,9]) # [900,1170,2340,5850,1300])
# p product_array([16,17,4,3,5,2]) # [2040,1920,8160,10880,6528,16320])

## Algorithm ##
# Iterate over the values in input array, multiplying each value by all the other values in the array. Add the product
# value to a new array and return that

# 1) calculate the total product of all values in the input array and store this to a local variable, product
# 2) Iterate over the input array values; on each iteration:
#     > divide product by the current value
#     > add this value to an output array



# Minimum Steps (Array Series #6)
# Given an array of N integers, you have to find how many times you have to add up the smallest numbers 
# in the array until their Sum becomes greater or equal to K.
# 
# List size is at least 3.
# 
# All numbers will be positive.
# 
# Numbers could occur more than once , (Duplications may exist).
# 
# Threshold K will always be reachable.

## Problem ##
# input - array (arr) and integer (k)
# output - integer
# rules/reqs
#   1) size of input array >= 3
#   2) values in input array are > 0
#   3) repetition of values in input array is allowed
#   4) there will always be a solution of additions such that sum >= k


def minimum_steps(arr, k)
  arr.sort!.map.with_index { |_,idx| arr.slice(0,idx+1) }.select do |subarr|
    subarr.sum >= k
  end.map(&:size).min - 1
end


## Examples ##
# p minimum_steps([4,6,3], 7) # 1
# p minimum_steps([10,9,9,8], 17) # 1
# p minimum_steps([8,9,10,4,2], 23) # 3
# p minimum_steps([19,98,69,28,75,45,17,98,67], 464) # 8
# p minimum_steps([4,6,3], 2) # 0


## Algorithm ##
# Sort the input array, then iterate over it, adding values to a running sum until the sum >= the second argument k
# Return the number of additions performed

# 1) Sort the input array
# 2) Iterate from 1 to size of array, taking slices starting at 0 and having the length equal to the current iter value
#    Calculate the sum of each slice, then filter out any slices whose sum is < k
# 3) Map the values in the array from #2 to the sizes of the subarrays, then return the minimum such value minus 1

# Transform To Prime

# Given a List [] of n integers , find minimum number to be inserted in a list, 
# so that sum of all elements of list should equal the closest prime number .

# List size is at least 2 .
# 
# List's numbers will only positives (n > 0) .
# 
# Repetition of numbers in the list could occur .
# 
# The newer list's sum should equal the closest prime number .

## Problem ##
# input - array
# output - integer
# rules/reqs
#   1) size of input array >= 2
#   2) all values are positive integers
#   3) repetition is possible
#   4) output should be closest prime number - sum of input array


def is_prime?(num)
  return false if num.even?
  sq = Math.sqrt(num).to_i

  3.upto(sq) { |div| return false if num % div == 0 }
  return true
end


def minimum_number(arr)
  sum = arr.sum
  maybe_prime = sum

  loop do
    return maybe_prime - sum if is_prime?(maybe_prime)
    maybe_prime += 1
  end
end


## Examples ##
# p minimum_number([3,1,2]) #1
# p minimum_number([5,2]) #0
# p minimum_number([1,1,1]) #0
# p minimum_number([2,12,8,4,6]) #5
# p minimum_number([50,39,49,6,17,28]) #2


## Algorithm ##
# Calculate sum of input array. Find closest prime number. Return input array sum - closest prime number

# 1) Get the sum of the input array and save it off
# 2) Iterate up from the sum from #1 and stop at the first prime
#     > sub process - see below
# 3) Return sum (from step #1) - prime (from step #2)

# is_prime? method to determine if a given number (num) is prime
# 
# 1) if num is  
# 2) calculate the square root of num (truncate to integer)
# 3) iterate from 3 to square root; on each iteration:
#     > check if num evenly divides the current value. If it does, return false
# 4) if we get through the square root value from #2, return true


# Maximum Triplet Sum (Array Series #7)


# Given an array/list [] of n integers , find maximum triplet sum in the array Without duplications .
# 
# Array/list size is at least 3 .
# 
# Array/list numbers could be a mixture of positives , negatives and zeros .
# 
# Repetition of numbers in the array/list could occur , So (duplications are not included when summing).


## Problem/Data ## 
# input - array
# output - integer
# rules/reqs
#   1) size of array >= 3
#   2) values in array can be any integer (+/-/0)
#   3) repetition can occur within the array
#   4) to calculate the output value, find the maximum possible sum of 3 consecutive, non duplicated values
# questions
#   1) what does ignoring duplicates when calculating triplet sum actually mean?
#       > based on the examples provided, I take it to mean we can completely disregard any values in the array that 
#         have already appeared at a prior index/position. This will be my assumption for my intial solution

def max_tri_sum(numbers)
  numbers.uniq.sort.reverse.slice(0, 3).sum
end


## Examples ##

# p max_tri_sum([3,2,6,8,2,3]) #17
# p max_tri_sum([2,9,13,10,5,2,9,5]) #32
# p max_tri_sum([2,1,8,0,6,4,8,6,2,4]) #18
# p max_tri_sum([-3,-27,-4,-2,-27,-2]) #-9
# p max_tri_sum([-14,-12,-7,-42,-809,-14,-12]) #-33
# p max_tri_sum([-13,-50,57,13,67,-13,57,108,67]) #232
# p max_tri_sum([-7,12,-7,29,-5,0,-7,0,0,29]) #41
# p max_tri_sum([-2,0,2]) #0
# p max_tri_sum([-2,-4,0,-9,2]) #0
# p max_tri_sum([-5,-1,-9,0,2]) #1


## Algorithm ##
# Locate any duplicated values in the input array and remove all but the 1st instance of each. Take the largest sum
# possible from any 3 values from the remaining values; return that sum.

# 1) Remove all duplicated values except for the first instance of each
# 2) Sort remaining values and take sum of first three of result; return that value




# Row Weights
# Scenario
# Several people are standing in a row divided into two teams.
# The first person goes into team 1, the second goes into team 2, the third goes into team 1, and so on.
# 
# 
# Given an array of positive integers (the weights of the people), return a new array/tuple of two integers, 
# where the first one is the total weight of team 1, and the second one is the total weight of team 2.
# 
# Array size is at least 1.
# All numbers will be positive.

## Problem ##
# input - array
# output - (new) array
# rules/reqs
#   1) size of array >= 1
#   2) all values in input array are positive
#   3) return value should be an array of size 2. The first value should be the sum of the input values are even positions;
#      the 2nd value should be the sum of the input values are odd positions

def row_weights(array)
  array.partition.with_index { |_, idx| idx.even? }.map(&:sum)
end


## Examples ## 

# p row_weights([80])  # to eq([80,0])
# p row_weights([100,50])  # to eq([100,50])
# p row_weights([50,60,70,80])  # to eq([120,140])
# p row_weights([13,27,49])  # to eq([62,27])
# p row_weights([70,58,75,34,91])  # to eq([236,92])
# p row_weights([29,83,67,53,19,28,96])  # to eq([211,164])
# p row_weights([0])  # to eq([0,0])
# p row_weights([100,51,50,100])  # to eq([150,151])
# p row_weights([39,84,74,18,59,72,35,61]) # to eq([207,235])
# p row_weights([0,1,0])  # to eq([0,1])


## Algorithm ##
# Split the input array into two separate arrays - one of the values at the even number positions, one at the odd number 
# positions. Find the sum of each. Return an array containing both; where a = sum of values at even number positions, b = sum of
# values at odd number positions: [a, b]


# Form The Minimum
# Given a list of digits, return the smallest number that could be formed from these digits, 
# using the digits only once (ignore duplicates).
# 
# Only positive integers will be passed to the function (> 0 ), no negatives or zeros.


## Problem ##
# input - array
# output - integer
# rules/reqs
#   1) ignore duplicates from the input array
#   2) all input values will be positive integers
#   3) output value should be the integer representation of the remaining input values, that is the smallest possible
#      value of all such int representations

def min_value(digits)
  digits.uniq.sort.join.to_i
end


## Examples ##

# p min_value([1, 3, 1]) # 13
# p min_value([4, 7, 5, 7]) # 457
# p min_value([4, 8, 1, 4]) # 148

## Algorithm ##
# Remove unique values from the input array. Sort the resulting array in ascending order. Join the values together and turn
# the result into an integer, then return that integer

# 1) Iterate over values in input array, removing any duplicated values except for the 1st instance of each
# 2) Sort the result from #1, in ascending order
# 3) Combine the resulting values into a string
# 4) Convert the string into an integer, and return it


# Nth Smallest Element (Array Series #4)

# Given an array/list [] of integers , Find the Nth smallest element in this array of integers
# 
# Array/list size is at least 3 .
# 
# Array/list's numbers could be a mixture of positives , negatives and zeros .
# 
# Repetition in array/list's numbers could occur , so don't Remove Duplications .

## Problem/Data ##
# input - array
# output - integer
# rules/reqs
#   1) size of input array is >= 3
#   2) input values can be any integer (+/-/0)
#   3) repetition is allowed


def nth_smallest(arr, pos)
  arr.sort[pos-1]
end

## Examples ##

p nth_smallest([3,1,2],2)   #2)
p nth_smallest([15,20,7,10,4,3],3)   #7)
p nth_smallest([-5,-1,-6,-18],4)   #-1)
p nth_smallest([-102,-16,-1,-2,-367,-9],5)   #-2)
p nth_smallest([2,169,13,-5,0,-1],4)   #2)

## Algorithm ##
# > Given a list of integers _arr_, and an indec value _pos_
# Locate the 3 smallest values. Take the value of this result at index position (pos - 1)

# 1) Sort the array in ascending order. 
# 2) Take the value at index position pos - 1 and return it


