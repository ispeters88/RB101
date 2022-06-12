# Bannerizer

# Write a method that will take a short line of text, and print it within a box.

def print_in_box(str)
  width = str.length + 2
  top_bottom = '+' + '-'* width + '+'
  spacer = '|' + ' ' * width + '|'
  middle = '|' + ' ' + str + ' ' + '|'
  puts "#{top_bottom}\n#{spacer}\n#{middle}\n#{spacer}\n#{top_bottom}"
end



## Problem ##
# input - string
# output - complex string, with multiple lines and formatting
# reqs/rules
#   1) output should be as follows:
#       1a) a box comprised of dashes and pipe characters, with '+' symbols at the corners
#       1b) input string should be printed inside the box
#       1c) input string should be centered on the box's horizontal dimension
#       1d) total box dimensions are - height: 5, width: n + 2, where n = length of the input string
# questions
#   1) 


## Examples ##

print_in_box('To boldly go where no one has gone before.')
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

print_in_box('')
=begin
+--+
|  |
|  |
|  |
+--+
=end

print_in_box('dog')
=begin
+-----+
|     |
| dog |
|     |
+-----+
=end

## Data/Algorithm ##
# > Given a string, str - 
#     1) Determine the length of the string. Initialize an integer variable and set it to the length
#     2) Build the first line as follows:
#         2a) one '+'' character
#         2b) n '-' characters, where n = str.length + 2
#         2c) one '+' character
#     3) Build the second line as folows
#         3a) one '|' character
#         3b) n ' ' characters, where n = str.length + 2
#         3c) one '|' character
#     4) Build the third line as follows:
#         4a) one ' ' character
#         4b) the value of str
#         4c) one ' ' character
#     5) Build the 4th line the same way as the second line (step #3)
#     6) Build the 5th line the same way as the 1st line (step #2)




## Further Exploration ##

# Modify this method so it will truncate the message if it will be too wide 
# to fit inside a standard terminal window (80 columns, including the sides of the box). 
# For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

# max string length is terminal window width - 4 characters (two '+' at the corners, two '-' or ' ' to center text)

TERMINAL_WIDTH = 80
MAX_STRING_LENGTH = TERMINAL_WIDTH - 4

def print_in_box_fe1(str)
  str_length = str.length
  width = str_length < MAX_STRING_LENGTH ? str_length + 2 : TERMINAL_WIDTH - 2
  top_bottom = '+' + '-'* width + '+'
  spacer = '|' + ' ' * width + '|'
  if str.length > MAX_STRING_LENGTH
    text = '|' + ' ' + str.slice(0,MAX_STRING_LENGTH) + ' ' + '|'
  else
    text = '|' + ' ' + str + ' ' + '|'
  end
  puts "#{top_bottom}\n#{spacer}\n#{text}\n#{spacer}\n#{top_bottom}"
end

print_in_box_fe1('To boldly go where no one has gone before.')
print_in_box_fe1('This is a test of a string that is way too long. It is definitely going to be longer than the maximum terminal window width of 80. There is no doubt in my mind. I will just keep typing and the width will be huge')


## Further Exploration pt 2 ##

## Data/Algorithm ##
# > # > Given a string, str - 
#     1) Determine the length of the string. Initialize an integer variable and set it to the length
#     2) Initialize a variable for the width of the box, and set it as follows:
#         2a) if the string is greater than 76 characters, set width to 80
#             2a.1) 
#         2b) if the string is less than 76 characters, set width to string.length + 4
#     2) Build the first line as follows:
#         2a) one '+'' character
#         2b) n '-' characters, where n = box width - 2
#         2c) one '+' character
#     3) Build the second line as folows
#         3a) one '|' character
#         3b) n ' ' characters, where n = box width - 2
#         3c) one '|' character
#     4) If the string is greater than 76 characters, 
#         4a) initialize an array of strings with length up to 76, and put each to the console in succession using the logic in
#             step #5
#     5) Otherwise, build the third line as follows:
#           4a) one ' ' character
#           4b) the value of str
#           4c) one ' ' character
#     6) Build the 4th line the same way as the second line (step #3)
#     7) Build the 5th line the same way as the 1st line (step #2)

def get_box_details(str_length)
  width = str_length < MAX_STRING_LENGTH ? str_length + 2 : TERMINAL_WIDTH - 2
  top_bottom = '+' + '-'* width + '+'
  spacer = '|' + ' ' * width + '|'
  [width, top_bottom, spacer]
end

def split_and_print_long_lines(str,str_length)
  line_arr = Array.new(0)
  counter = 0

  loop do
    break if counter > str_length / MAX_STRING_LENGTH
    start = counter * MAX_STRING_LENGTH
    line_arr << str.slice(start,MAX_STRING_LENGTH)
    counter += 1
  end

  line_arr.each do |substr|
    puts '|' + ' ' + substr.ljust(MAX_STRING_LENGTH) + ' ' + '|'
  end

end


def print_in_box_fe2(str)
  str_length = str.length
  width, top_bottom, spacer = get_box_details(str.length)

  puts top_bottom
  puts spacer

  if str.length > MAX_STRING_LENGTH
    split_and_print_long_lines(str,str_length)
  else
    '|' + ' ' + str + ' ' + '|'
  end

  puts spacer
  puts top_bottom

end

print_in_box_fe2('This is a test of a string that is way too long. It is definitely going to be longer than the maximum terminal window width of 80. There is no doubt in my mind. I will just keep typing and the width will be huge')
