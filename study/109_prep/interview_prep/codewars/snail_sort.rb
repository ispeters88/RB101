
DIRECTIONS = [:east, :south, :west, :north]
DIRECTION_COORDS = {east : [1, 0], south : [0, 1], west : [-1, 0], north = [0, -1] }

def set_direction_data(dir_num)
  direction = DIRECTIONS[dir_counter]
  change_x, change_y = DIRECTION_COORDS[direction]
  [direction, change_x, change_y]
end

def snail(array)
  x, y, dir_counter, circuit = Array.new(4) { 0 }
  direction, change_x, change_y = set_direction_data(dir_counter)
  result = Array.new

  loop do
    loop do
      result << array[x][y]
      x += change_x
      y += change_y
      break if 
    end
    break if result.size == n ** 2
    
    if dir_counter == DIRECTIONS.size
      dir_counter = 0
      circuit += 1
    else
      dir_counter += 1
    end
    direction, change_x, change_y = set_direction_data(dir_counter)
    
  end

  result
end



## Algorithm ##
# > Given a 2D nested array, arr:

# Use a hash to store "directions" along with coordinate change values that coorespond to moving in those
# directions. 
# Iterate over arr, changing the "coordinate" values based on the current direction. Once an iteration is done, update
# the direction. 
#     > the direction order is [east, south, west, north]. Depending on the size of n, it may be necessary to loop over this
#       list of directions more than once
# While iterating, add values from arr to a new results array by changing values of x and y based on the current direction.





# Set up a hash with directions and corresponding coordinate changes
# Define an initial direction: east
# Initialize two variables, x and y, setting both to 0
# Initialize an empty Array object, result




# 
# Iterate, until the size of the result array is equal to n ** 2. On each iteration:
#     1) set change_x and change_y to appropriate coordinate values for the current direction
#     2) Iterate until