## Easy 5, Exercise 2 ##
## Further exploration ##
## Problem 3 ##
# How would you approach this problem if you were allowed to use ruby's 
# Date and Time classes and wanted to consider the day of week in your calculation? 
# (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; 
# in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

require 'date'

SEC_PER_MIN = 60
MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def coerce_sunday(date)
  while !date.sunday?
    date = date + 1
  end
  date
end

def update_time_by_minutes(int, date)
  time = date.to_time
  time + (int * SEC_PER_MIN)
end

def time_of_day_p2(int)
  date = coerce_sunday(Date.new(2022))
  date = update_time_by_minutes(int, date)
  date.strftime("%A %H:%M")
end


## Examples ##
p time_of_day_p2(0) #== "Sunday 00:00"
p time_of_day_p2(-3) #== "Saturday 23:57"
p time_of_day_p2(35) #== "Sunday 00:35"
p time_of_day_p2(-1437) #== "Saturday 00:03"
p time_of_day_p2(3000) #== "Tuesday 02:00"
p time_of_day_p2(800) #== "Sunday 13:20"
p time_of_day_p2(-4231) #== "Thursday 01:29"