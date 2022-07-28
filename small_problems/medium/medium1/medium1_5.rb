# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer 
# that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

## Problem ##
# input - odd integer, n
# output - display to console, diamond pattern (more detail below)
# rules/reqs
#   1) n is always a positive odd integer
#   2) the width of each line is n
#   3) each set of * characters should be centered on the range of n

require "pry-byebug"

def diamond(n)
  center = n / 2 + 1
  star_arr = Array.new

  1.upto(center) do |num|
    star_arr << ("*" * (2  * num - 1)).center(n) if num < center + 1
  end

  star_arr.each { |line| puts line }
  star_arr.reverse[1..].each { |line| puts line }
end

=begin
## Examples ##
diamond(3)
diamond(9)
diamond(27)
=end

## Data/Algorithm 
# > Given an odd integer, n - 
#   1) Store off the center index of the range of n
#   2) Iterate over the range of n
#   3) For each iteration, calculate the number of stars to print via:
#       > 
#   4) Print that many stars, centered on the value of n

## Further Exploration ##
# Try modifying your solution or our solution so it prints only the outline of the diamond

def diamond_fe(n, outline=false)
  center = n / 2 + 1
  star_arr = ["*".center(n)]
  inner_char = outline ? " " : "*"z

   2.upto(center) do |num|
     star_arr << ("*" + inner_char * (2 * num - 3) + "*").center(n)
   end

  star_arr.each { |line| puts line }
  star_arr.reverse[1..].each { |line| puts line }
end

diamond_fe(3)
diamond_fe(3, true)
diamond_fe(9)
diamond_fe(9, true)
diamond_fe(23)
diamond_fe(23, true)