# Seeing Stars

# Write a method that displays an 8-pointed star in an nxn grid, 
# where n is an odd integer that is supplied as an argument to the method. 
# The smallest such star you need to handle is a 7x7 grid.

require "pry-byebug"

def star(n)
  center = n / 2
  star_arr = Array.new
  (0...center).each do |num|
    spacer = " " * (center - num - 1)
    star_arr << " " * num + ("*" + spacer) * 3
  end
  star_arr.each { |line| puts line }
  puts "*" * n
  star_arr.reverse.each { |line| puts line }
end
  
# star(7)
# star(9)
# star(15)

## Data/Algorithm ##
# > Given an odd integer, n (greater than 7)
#     1) Calculate the "center" of n (i.e. center index of an n-sized array)
#     2) Initialize an array of size center - 1
#     3) Iterate over the range 0 - (center - 1)
#         > On each iteration, add leading whitespace with length = iteration number (start at 0)
#         > then add 3 copies of the following string: 
#             >> * character + whitespace with length (center - iteration number - 1)



## Further Exploration ##
# What other patterns can you come up with that can be produced in similar ways to the patterns of this exercise? 
# Can you draw a reasonable looking circle? How about a sine wave?

#require "math"

def get_side(z, rad)
  z < rad ? rad - z : z - rad
end

def from_center(x, y, rad)
  a = get_side(x, rad)
  b = get_side(y, rad)

  Math.sqrt(a**2 + b**2)
end

def star_fe_circle(diameter)
  radius = diameter / 2

  (0..diameter).each do |x|
    (0..diameter).each do |y|
      print from_center(x, y, radius).round == radius ? "*" : ' '
    end
  end
end

star_fe_circle(9)
puts ""
star_fe_circle(15)



## Data/Algorithm  ##
##   sine wave     ##

# > given a number, num
#     1) calculate sin(n) for all n between -num and num
#     2) create a hash
#         keys: sin(n) values
#         values: array, containing values of n for each sin(n)
#     3) plot those values

require "bigdecimal/math" 

PI = BigMath.PI(10)
SCALE = 0.1

def star_fe_sine(num)
  center = num / 2  
  star_coords = Hash.new
  x = -PI * num

  # y goes from num to -num, reflected over center
  # 

  n = -2 * PI * num

  loop do
    current_key = Math.sin(n)
    star_coords[current_key] = n
    n += SCALE
    break if n > 2 * PI * num
  end

  binding.pry

  #(-num..num).each { |n| star_coords[n] = Math.sin(n) }
#
  #(-PI * num..PI * num).each do |x|
  #  (-2..2).each do |y|
  #    print 
#
  #  print " " * (center - y) + "*"
  #end
end

## Examples ##
star_fe_sine(7)
star_fe_sine(9)
star_fe_sine(15)

