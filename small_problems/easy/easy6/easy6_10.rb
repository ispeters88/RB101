# Right Triangles

# Write a method that takes a positive integer, n, as an argument, 
# and displays a right triangle whose sides each have n stars. 
# The hypotenuse of the triangle (the diagonal side in the images below) 
# should have one end at the lower-left of the triangle, and the other end at the upper-right.

## Problem ##
# input - positive integer, n
# output - display to the console
# rules/reqs - console display should include
#   1) n lines of text
#   2) each line should contain i right justified * characters, where i is the line number

def triangle(length)
  length.times do |row|
    puts ("*" * (row + 1)).rjust(length)
  end
end

triangle(3)
triangle(5)
triangle(9)
triangle(2)
triangle(0)


## Further Exploration ##
# Try modifying your solution so it prints the triangle upside down from its current orientation. 
# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle_upside_down(length)
  length.times do |row|
    puts ("*" * (length - row)).rjust(length)
  end
end

triangle_upside_down(3)
triangle_upside_down(5)
triangle_upside_down(9)
triangle_upside_down(2)
triangle_upside_down(0)

def star_multiplier(length, row, vert_orientation)
  if vert_orientation == 'regular'
    row + 1
  else
    length - row
  end
end

def triangle_flex_orientation(length, corner=4)
  row_just = corner.even? ? 'right' : 'left'
  vert_orientation = corner < 3 ? 'regular' : 'upside down'

  length.times do |row|
    if row_just == 'right'
      puts ("*" * star_multiplier(length, row, vert_orientation)).rjust(length)
    else
      puts ("*" * star_multiplier(length, row, vert_orientation)).ljust(length)
    end
  end
end

#triangle_flex_orientation(3)
triangle_flex_orientation(5)
triangle_flex_orientation(5, 2)
triangle_flex_orientation(5, 1)
triangle_flex_orientation(5, 3)