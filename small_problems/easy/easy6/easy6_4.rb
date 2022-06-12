# Reversed Arrays (Part 1)

=begin
Write a method that takes an Array as an argument, and reverses its elements in place; 
that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the array. 
The array only has one element, a String, but we're not reversing the String itself, 
so the reverse! method call should return ['abc'].
=end

def get_temp_arr(arr)
  counter = 0
  size = arr.size
  temp_arr = Array.new

  loop do
    break if counter == size
    temp_arr[counter] = arr.pop
    counter += 1
  end

  temp_arr
end

def reverse!(arr)
  temp_arr = get_temp_arr(arr)
  counter = 0

  loop do
    break if counter == temp_arr.size
    arr[counter] = temp_arr[counter]
    counter += 1
  end
  arr
end


## Examples ##
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
reverse!(list) == [] # true
p list == [] # true



## Additional solutions ##

# > This problem gave me a hard time, so I wanted to note some other solutions that I found to be interesting

def reverse!(array)
  temp = array.clone

  array.map! { |_| temp.pop }
end

# not a particularly efficient approach, but short and gets the job done
def reverse!(arr)
  temp = []
  arr.length.times { |element| temp << arr.pop }
  arr.prepend(temp).flatten!
end

def reverse!(array)
  array.size.times do |i|
    array.insert(i, array.pop)
  end

  array
end