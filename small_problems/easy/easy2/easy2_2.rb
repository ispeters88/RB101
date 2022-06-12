# How big is the room?


=begin

Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

=end

## Problem ##
# input - two numbers (integers?), user supplied
# output - 1 number (float?)
# requirements
#   1) no need to validate input
#   2) get length and width values via user input
#   3) output two values for the area - one in square meters and one in square feet
# questions
#   1) should we return a float, or an integer value?

## Example ##
=begin
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end

## Data/Algorithm ##
#   1) Create two variables (length, width) via user input
#   2) Calculate the area using the length and width values in square meters
#     2a) the input values are in meters. 1 square meter == 10.7639 square feet
#   3) Calculate the area in square feet
#   4) Return both values
# note: for my solution, I am assuming we should work with floats.

# Use a constant, not "magic numbers:!!!
SQM_TO_SQFT = 10.7639


def get_dimensions(unit="meters")
  puts "Enter the length of the room in #{unit}:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in #{unit}:"
  width = gets.chomp.to_f
  [length, width]
end

room_length, room_width = get_dimensions

room_area = room_length * room_width
room_area_feet = (room_area * SQM_TO_SQFT).round(3)

puts "The area of the room is #{room_area} square meters (#{room_area_feet} square feet)."

# further exploration

SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.0304

room_length_further, room_width_further = get_dimensions("feet")

room_area_further = room_length_further * room_width_further
room_area_further_in = (room_area_further * SQFT_TO_SQIN).round(3)
room_area_further_cm = (room_area_further * SQFT_TO_SQCM).round(3)

puts "The area of the room is #{room_area_further} square feet (#{room_area_further_in} square inches)."
puts "This is #{room_area_further_cm} square centimeters"