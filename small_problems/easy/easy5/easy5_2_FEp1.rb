## Easy 5, Exercise 2 ##
## Further exploration ##
## Problem 1 ##

SEC_PER_MIN = 60
MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MIN_PER_DAY
  end

  minutes % MIN_PER_DAY
end

# it's possible to write a single calculation with % that performs the entire normalization operation in one line of code. 
# Give it a try, but don't spend too much time on it.

#
# >> Reminder of modulo/remainder rules
# Modulo operations return a positive integer when the second operand is positive, 
# and a negative integer when the second operand is negative.

# Remainder operations return a positive integer when the first operand is positive, 
# and a negative integer when the first operand is negative.
#

# algorithm - reverse the sign of the modulo result when the second operand is negative

def normalize_minutes(minutes)
  minutes < 0 ? -(minutes % MIN_PER_DAY) : minutes % MIN_PER_DAY
end

def time_of_day_modulo(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  p delta_minutes
  hours, minutes = delta_minutes.divmod(MIN_PER_HR)
  format('%02d:%02d', hours, minutes)
end

## Examples ##
p time_of_day_modulo(0) #== "00:00"
p time_of_day_modulo(-3) #== "23:57"
p time_of_day_modulo(35) #== "00:35"
p time_of_day_modulo(-1437) #== "00:03"
p time_of_day_modulo(3000) #== "02:00"
p time_of_day_modulo(800) #== "13:20"
p time_of_day_modulo(-4231) #== "01:29"