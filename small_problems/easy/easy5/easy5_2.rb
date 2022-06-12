# After Midnight (Part 1)

=begin

The time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Disregard Daylight Savings and Standard Time and other complications.

=end

## Problem ##
# edge cases to consider
#     00 when the hour or minute is 0

SEC_PER_MIN = 60
MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def get_hrs_and_minutes(int)
  hours_tot, minutes = int.divmod(MIN_PER_HR)
  days, hours_condensed = hours_tot.divmod(HR_PER_DAY)
  [hours_condensed, minutes].map do |val| 
    val == 0 ? '00' : val < 10 ? val.to_s.prepend('0') : val.to_s
  end
end

def time_of_day(int)
  hours, minutes = get_hrs_and_minutes(int)
  "#{hours}:#{minutes}"
end

## Examples ##
p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"


## Data/Algorithm ##
# > Given an integer, int - 
#     1) Create a four integer representation  of the time by iterating over the hours of the day, with
# int representing the number of minutes to iterate
#       1a) convert the minute total into hours and minutes (which will be added or subtracted)
#       1b) add the hours and minutes to 00:00 (for positive int) or subtract the hours and minutes from 00:00 (negative int)
#     2) Convert the four int value to a string
#     3) Add a : character between the 2nd and 3rd characters of the string
#     4) return the string

## Further Exploration ##

# file was getting way too long and difficult to work with. the 3 problems in this FE have been moved to separate .rb files
# with the suffix tag _FEp#