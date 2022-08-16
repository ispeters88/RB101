# You live in the city of Cartesia where all roads are laid out in a perfect grid. 
# You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. 
# The city provides its citizens with a Walk Generating App on their phones -- 
# everytime you press the button it sends you an array of one-letter strings representing directions to walk 
# (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) 
# and you know it takes you one minute to traverse one city block, so create a function that will 
# return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) 
# and will, of course, return you to your starting point. Return false otherwise.
# 
# Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). 
# It will never give you an empty array (that's not a walk, that's standing still!).



def is_valid_walk(walk)
  return false if walk.size != 10

  directions = { 'n' => [1, 0], 's' => [-1, 0], 'e' => [0, 1], 'w' => [0, -1] }
  start_coords, coords = Array.new(2) { Array.new(2, 0) }

  walk.each do |direction|
    coords[0] += directions[direction][0]
    coords[1] += directions[direction][1]
  end

  start_coords == coords
end

p is_valid_walk(['n', 'w', 'e', 's', 'w', 's', 's', 'n', 'n', 'e'])

## Data/Algorithm ##
# > Given an array, walk - 
#     1) initialize a hash, directions:
#         > keys - 'n', s', 'e', 'w'
#         > two-item arrays representing coordinates - [x, y]
#     2) initialize 2 two item arrays, start_coords - [a, b], and coords - [c, d]
#     3) iterate over the directions hash
#         > on each iteration, update the coords array using the coordinates from the current iteration
#     4) return true if the size of walk equals 10 final value of coords is equal to start_coords