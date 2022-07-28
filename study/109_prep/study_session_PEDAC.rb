# You wake up at the control board of a submarine. 
# In front of you is a panel of buttons and a note left by the previous captain: 
# "Use the buttons to set the ship's depth, and aim for as close to n leagues as possible -- 
# but definitely don't go higher! You can select only one set of buttons, and *together* they determine the depth. 
# Here's the last course I set: 2. And I was aiming to be higher than 7.
# 
# The buttons in front of you are as follows:
# 2
# 3
# 1
# 2
# 4
# 3



## Problem ##
# input - number (integer?)
# output - sequence of numbers (perhaps an array)
# goal - we need to establish a combination of numbers that (in some manner) determine the depth the submarine will arrive at
#        > that depth should be <= n
# rules/reqs
#   1) starting point is 2 leagues
#   2) goal depth is 7 leagues or higher
#   3) presumably the depth value cannot go lower than 0
#   4) sets have to be consecutive in the order that the problem statement lays out
# questions
#   1) are there any constraints on how many buttons constitutes a set?
#       > (from Spencer) not on number, but on order they can be pushed
#   2) can buttons change the depth in either direction?
#   3) 

## Examples ##
# button set: [2]
# result: 2

# button set : [3, 1]
# result: 2


## Data ##
# 


# Given an array of n positive integers and a positive integer, 
# find the minimal length of a contiguous subarray for which the sum >= integer.

## Problem ##
# input - 1) array, arr 2), positive integer, x
# output - integer
# rules/reqs
#   1) values in arr are positive
#   2) arr may or may not be empty
#   3) values used from arr should be consecutive/contiguous

## Examples ##
=begin
n = 5
arr = [1, 3, 4, 5, 2]

sub(arr, n)

n = 1
arr = []

sub(arr, n)
=end
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0



## Data/Algorithm ##
# Given an array of n positive integers, arr and a positive integer, x -

#   > Find all the contiguous subarrays of arr and save them off if their sum is greater than or equal to x
#   > get the smallest length of these subarrays and return it

# 1) initialize an array to store subarrays - subarrs
# 2) initialize a variable size and assign it to the length of arr
# 2) Iterate over the values of arr; on each iteration, with index i :
#     > generate all the possible slices of arr from i to end, via 2nd iteration, with index k :
#       > on each iteration, take slice arr from i to k, add it to subarrays if its sum >= x
# 3) Iterate over the subarrays in subarrs: find the mininum length value in subarrs

require "pry-byebug"

def minSubLength(arr, x)
  subarrs = Array.new
  size = arr.size

  0.upto(size) do |i|
    i.upto(size) do |k|
      subarrs << arr[i..k] if arr[i..k].sum >= x
    end
  end

  #binding.pry
  subarrs.map { |subarr| subarr.length }.min || 0
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0



=begin
I have interviewed five software engineering candidates over the past two weeks, including folks with grad degrees 
in computer science/ex-FAANG with 7+ years of experience. All five were jointly rejected by myself and a 
  co-interviewer either because the candidates jumped straight into implementation and ended up with bugs during testing or 
  unhandled edge cases, and/or their oral-written communication was poor.

So, for those folks who are 'PEDACing' for the first few times:
1) Train your problem solving muscles to start with PEDAC by default (or some equivalent thereof);
2) Get comfortable talking through problems out loud, not just typing silently.

Can't stress enough that PEDAC isn't an arbitrary heuristic meant for getting through the curriculum or 109/129 oral assessments. 
PEDAC works, especially under pressure.
=end


=begin
PEDAC reminders

Algorithm:
- Goal: write out steps to solve the given problem in plain English
- A logical sequence of steps for accomplishing a task/objective
- Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
- Stay programming-language-agnostic
- Can create substeps for different parts or separate concerns into a helper method
- You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
- Before moving onto implementing the algorithm, check it against a few test cases
=end

=begin
Code
- Goal: translate the algorithm into your programming language of choice
- Code with intent. Avoid hack and slash - TEST FREQUENTLY
- Use the REPL or run your code as a file
- When testing your code, always have an idea in place of what you're expecting
=end
