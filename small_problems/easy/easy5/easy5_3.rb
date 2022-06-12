# After Midnight (Part 2)

=begin

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, 
the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, 
respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

=end

MIN_PER_HR = 60
MIN_PER_DAY = 1440

def before_midnight(time)
  hours, minutes = time.split(':').map {&:to_i }
  (hours * MIN_PER_HR - minutes) % MIN_PER_DAY
end

def after_midnight(time)
  hours, minutes = time.split(':').map {&:to_i }
  (hours * MIN_PER_HR + minutes) % MIN_PER_DAY
end

## Problem ##
# input - string, represents time in HH:SS format
# output - integer
# reqs/rules
#   1) output integer should be the number of minutes elapsed from midnight to input string. can be any int value
# questions
#   1) can we assume input is validated?

## Examples ##
p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0


## Data/Algorithm ##
# > Given a string, time_str, which represents a time in HH:SS format -
#     1) split the string on the : character, to get separate hours and minutes values
#     2) convert the hours and minutes values to integers
#     3) update the hour/minute values, based on which method is used. Before uses difference, After uses sum
#       3a) get the hours sum/difference between time_str.hours and midnight (0)
#       3b) get the minutes sum/difference between time_str.minutes and midnight (0)
#     5) return hours * 60 + minutes



## Further exploration ##

# How would these methods change if you were allowed to use the Date and Time classes?

# > If allowed to use Date and Time, I would set up an initial Time object, tm with #time = midnight
# I would then add or subtract the minutes from tm depending on which method was called, and return the updated time value.