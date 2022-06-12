## Easy 5, Exercise 2 ##
## Further exploration ##
## Problem 2 ##

# How would you approach this problem if you were allowed to use ruby's Date and Time classes?

# >> Step 1 - review documentation for those classes
#       found "format string" type method for Time, Time#strftime. Using Time.strftime("%H:%M") will do the formatting for us
#       with this in mind, we can redesign to just focus on getting the hour and minute values in integer form

SEC_PER_MIN = 60
MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def update_time_by_minutes(int, time)
  time + (int * SEC_PER_MIN)
end

def time_of_day_p2(int)
  time = Time.new(2022)
  time = update_time_by_minutes(int, time)
  time.strftime("%H:%M")
end

## Examples ##
p time_of_day_p2(0) #== "00:00"
p time_of_day_p2(-3) #== "23:57"
p time_of_day_p2(35) #== "00:35"
p time_of_day_p2(-1437) #== "00:03"
p time_of_day_p2(3000) #== "02:00"
p time_of_day_p2(800) #== "13:20"
p time_of_day_p2(-4231) #== "01:29"