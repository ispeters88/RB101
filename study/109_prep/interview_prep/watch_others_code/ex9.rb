# 9. (part 6)
# * 12:52 * 

=begin
You are going to be given an array of integers. Your job is to take that array and find an index N where the 
sum of the integers to the left of N is equal to the sum of the integers to the right of N. 
If there is no index that would make this happen, return -1.
For example:
Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, 
because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the 
index ([3,2,1]) both equal 6.

Another one: 
You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

=end

## problem & data structures ##
# input - array
# output - integer
# goal: find and return an index position N from the input array, such that the sum of [0...N] is equal to the sum of [N+1..]
# rules/reqs
#   1) input array contains integers - can be +/-/0
#   2) It is possible for no index that satisfies the requirement to exist. In this case, return value should be -1
#   3) sum of an empty array (i.e. left side of index position 0, or right side of index position = size of input array) is 0
# questions
#   1) what to do if there are two such index positions?

def get_side_sums(numbers)
  side_sums = Array.new
  
  numbers.each_index do |idx|
    left_sum, right_sum = numbers[0...idx].sum, numbers[idx+1..].sum
    side_sums << [left_sum, right_sum]
  end

  side_sums
end

def find_even_index(numbers)
  side_sums = get_side_sums(numbers)

  side_sums.each_with_index do |(left_sum, right_sum), idx|
    return idx if left_sum == right_sum
  end

  -1
end


def find_even_index_refactor(numbers)
  numbers.each_index do |idx|
    left_sum, right_sum = numbers[0...idx].sum, numbers[idx+1..].sum
    return idx if left_sum == right_sum
  end
  -1
end


## examples ##
p find_even_index_refactor([1,2,3,4,3,2,1]) == 3
p find_even_index_refactor([1,100,50,-51,1,1]) == 1
p find_even_index_refactor([1,2,3,4,5,6]) == -1
p find_even_index_refactor([20,10,30,10,10,15,35]) == 3
p find_even_index_refactor([20,10,-80,10,10,15,35]) == 0
p find_even_index_refactor([10,-80,10,10,15,35,20]) == 6
p find_even_index_refactor(Array(1..100)) == -1
p find_even_index_refactor([0,0,0,0,0]) == 0
p find_even_index_refactor([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index_refactor(Array(-100..-1)) == -1

## algorithm ##
# Iterate over the index positions in the input array. Transform values and assign transformed array to a local variable side_sums
#   > Calculate the sum of the values to the left of the current index position, and the sum of the values to the right. 
#   > The transformed value for the new array is a subarray [left side sum, right side sum]

# Iterate over the new transformed array
#   > check if the first and last values of the subarray at the current iteration, are equal. If so, return the index
# If iteration completes, return -1
