# 1. method that returns the sum of two integers
=begin

>> casual

Given two integers x and y
Add the values of x and y
Return the result of adding x and y

>> formal

START
Given two integers x and y
SET sum = x + y
PRINT sum
END

=end

# 2. method that takes an array of strings, and returns a string that is all those strings concatenated together
=begin

>> casual

Given an array of strings:
Initialize a variable under class String: "result"
Iterate over the array
  - Concatenate each individual item in the array onto result
Return the result variable

START
Given an array of strings, arr

SET index = 
SET result = ""
WHILE index < size of arr
  result = result + value within arr at space 'index'
PRINT result
END

=end

# 3. a method that takes an array of integers, 
# and returns a new array with every other element from the original array, starting with the first element

=begin

>> casual

Given an array of ints, arr
Initialize a new empty array, new_arr
Iterate over the array
  - Add the first element (index 0) to new_arr
  - For any subsequent elements, if the index value is even, add it to new_arr
Return new_arr

>> formal

START
Given an array of ints - arr

SET new_arr = blank array
SET old_index = 0
SET new_index = 0

WHILE index < size of array
  SET current item = value within arr at space 'old_index'
  SET value within new_arr at space new_index = current item
  
  SET old_index = old_index + 2
  SET new_index = new_index + 1

END

=end

# 4. a method that determines the index of the 3rd occurrence of a given character in a string. 
# For instance, if the given character is 'x' and the string is 'axbxcdxex', 
# the method should return 6 (the index of the 3rd 'x'). 
# If the given character does not occur at least 3 times, return nil.

=begin 

>> casual

Given a string - str
and a specific character - ch
Initialize a variable, index, to keep track of where we are in str
Initialize a variable, found, to keep track of occurrences of ch
Iterate over the characters in str one by one
If the value of str at index is equal to ch, add one to found
If the value of found is 3, set result to the value of str at index
Add one to the value of index

Return result

>> formal

Given:
  a string - str
  a character - ch
SET index = 0
SET found = 0
SET result = nil

WHILE index < length of str
  IF value of str at index = ch
    SET found = found + 1
  SET index = index + 1
  IF found = 3
    PRINT found

PRINT nil

END

=end

# a method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array, 
# while the elements of the second array should become the elements at the odd indexes. 

=begin

>> casual

Given two arrays - arr1 and arr2 (same number of elements)
Create a new empty arr, merge_arr
Initialize a variable, index, and set it to 0
Iterate through arr1
Add the current value from arr1 to merge_arr, at place index
Add 2 to index
Stop when index > size of arr1

Set index to 1
Iterate through arr2
Add the current value from arr2 to merge_arr, at place index
Add 2 to index
Stop when index > size of arr2

Return/display merge_arr

>> formal

START

Given two arrays - arr1 and arr2 - with the same number of elements
SET merge_arr = []
SET merge_index = 0
SET index = 0
WHILE index < size of arr1
  SET value in merge_arr at place merge_index = index
  index = index + 2
index = 1  
WHILE index < size of arr2
  SET value in merge_arr at place merge_index = index
  index = index + 2

PRINT merge_arr
END

=end