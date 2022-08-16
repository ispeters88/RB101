# * 32:13 * 


# Introduction
# Welcome Adventurer. Your aim is to navigate the maze and reach the finish point without touching any walls. Doing so will kill you instantly!
# Task
# You will be given a 2D array of the maze and an array of directions. Your task is to follow the directions given. 
# If you reach the end point before all your moves have gone, you should return Finish. 
# If you hit any walls or go outside the maze border, you should return Dead. 
# If you find yourself still in the maze after using all the moves, you should return Lost.
# The Maze array will look like
# 
# maze = [[1,1,1,1,1,1,1],
#         [1,0,0,0,0,0,3],
#         [1,0,1,0,1,0,1],
#         [0,0,1,0,0,0,1],
#         [1,0,1,0,1,0,1],
#         [1,0,0,0,0,0,1],
#         [1,2,1,0,1,0,1]]
# ..with the following key
# 
#       0 = Safe place to walk
#       1 = Wall
#       2 = Start Point
#       3 = Finish Point
#   direction = ["N","N","N","N","N","E","E","E","E","E"] == "Finish"
# Rules
# 1. The Maze array will always be square i.e. N x N but its size and content will alter from test to test.
# 
# 2. The start and finish positions will change for the final tests.
# 
# 3. The directions array will always be in upper case and will be in the format of N = North, E = East, W = West and S = South.
# 
# 4. If you reach the end point before all your moves have gone, you should return Finish.
# 
# 5. If you hit any walls or go outside the maze border, you should return Dead.
# 
# 6. If you find yourself still in the maze after using all the moves, you should return Lost.
# Good luck, and stay safe!

## problem & data structures ##
# input - two arrays
# output - string
# goal - return the appropriate string based on the rules laid out, the maze, and the directions
# rules/reqs
#   1) 1st input array will be a 2D square nested array of integers between 0 and 3; mapping for value rules below:
# 
#   2) 2nd input contains integer values "N", "E", "S", "W" representing directions to move in
#   3) 

CARDINAL_COORDS = { "N" => [0, -1], "E" => [1, 0], "S" => [0, 1], "W" => [-1, 0] }
MAZE_VAL_MEANINGS = { 0 => "Safe", 1 => "Wall", 2 => "Start", 3 => "Finish" }

def get_start_point(maze)
  y = maze.find_index { |row| row.any? { |maze_val| MAZE_VAL_MEANINGS[maze_val] == "Start" } }
  x = maze[y].find_index { |maze_val| MAZE_VAL_MEANINGS[maze_val] == "Start" }
  [x, y]
end

def maze_result(maze, x, y)
  case maze[y][x]
  when 1 then "Dead"
  when 3 then "Finish"
  end
end

def maze_runner(maze, directions)
  maze_size = maze.size
  x, y = get_start_point(maze)

  directions.each do |direction|
    delta_x, delta_y = CARDINAL_COORDS[direction]
    x += delta_x
    y += delta_y
    return "Dead" if [x, y].any? { |coord| coord >= maze_size }
    return maze_result(maze, x, y) unless maze[y][x] == 0
  end
  "Lost"
end


## examples ##

maze = [[1,1,1,1,1,1,1],
        [1,0,0,0,0,0,3],
        [1,0,1,0,1,0,1],
        [0,0,1,0,0,0,1],
        [1,0,1,0,1,0,1],
        [1,0,0,0,0,0,1],
        [1,2,1,0,1,0,1]]

p maze_runner(maze,["N","N","N","N","N","E","E","E","E","E"]) #,"Finish")
p maze_runner(maze,["N","N","N","N","N","E","E","S","S","E","E","N","N","E"]) #, "Finish")
p maze_runner(maze,["N","N","N","N","N","E","E","E","E","E","W","W"]) #, "Finish")

p maze_runner(maze,["N","N","N","W","W"])# , "Dead")
p maze_runner(maze,["N","N","N","N","N","E","E","S","S","S","S","S","S"])# , "Dead")
p maze_runner(maze,["N","E","E","E","E"])# , "Lost")


## algorithm ##
# create a results hash table with the possible results of running the maze
# create a hash table with letters mapped to coordinate changes
# Find start point
# Set initial coordinates to (outer array index, inner array index)
# Iterate over the values in the 2nd input array (directions)
#   > update the current coordinates based on the current iteration letter
#   > check if the current maze value is in the results hash - if it is, respond accordingly
# If iteration is complete and still in maze, return "Lost"