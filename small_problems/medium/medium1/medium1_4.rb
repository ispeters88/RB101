# 1000 Lights

=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
=end

require "pry-byebug"

def toggle_switches(n)
  switch_arr = Array.new(n) { false }

  switch_arr.size.times do |num|
    switch_arr.map!.with_index do |switch, idx| 
      (idx + 1) % (num + 1) == 0 ? !switch : switch
    end
  end
  
  switch_arr.map.with_index { |bool, idx| idx + 1 if bool }.compact
end

p toggle_switches(5)
p toggle_switches(10)
p toggle_switches(1000)


## Data/Algorithm ##
# > Given a number, n - 
#     1) Initialize an array with n values - switch_arr. Set all values to false
#     2) Iterate over the array n times
#         On each iteration, iterate over the values in switch_arr, with index values available
#     3) On each internal iteration, flip the boolean value at all indices that are multiples of the current
#       iteration number


## Further Exploration ##
# There are a few interesting points about this exercise that we can explore:
# 
# Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?
# >  

# What are some alternatives for solving this exercise? 
# What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?
#  > My solution took this approach, using boolean values to represent on/off

# We could have a method that replicates the output from the description of this problem 
# (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?
# > We would have to do a partition or two selects on the array/hash to split into on and off, then
#   write puts statements with each.