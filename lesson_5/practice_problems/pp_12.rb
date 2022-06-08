# Practice Problem 12

# Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

def make_a_hash(array)
  arr_hash = Hash.new(0)
  array.each do |subarr|
    arr_hash[subarr[0]] = subarr[1]
  end
  arr_hash
end

p make_a_hash(arr)