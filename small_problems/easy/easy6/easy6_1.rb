# Cute angles

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees 
# and returns a String that represents that angle in degrees, minutes and seconds. 
# You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, 
# and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.


# Note: your results may differ slightly depending on how you round values, 
# but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:



=begin
The whole units of degrees will remain the same 
(e.g., if your figure is 121.135 degrees longitude, start with 121 degrees).

Multiply the decimal portion of the figure by 60 (e.g., .135 * 60 = 8.1).

The whole number becomes the minutes (8).

Take the remaining decimal and multiply it by 60 (e.g., .1 * 60 = 6).

The resulting number becomes the seconds (6 seconds). Seconds can remain as a decimal if needed.

Take your three sets of numbers and put them together, 

(e.g., 121°8'6" longitude would be equivalent to 121.135 degrees longitude).

DEGREE = "\xC2\xB0"
MULTIPLIER = 60

def get_minutes_and_seconds(angle)
  total = angle * MULTIPLIER
  [total.to_i, ((total - total.to_i) * MULTIPLIER).to_i]
end


def dms(angle)
  degree = angle.to_i
  minutes, seconds = get_minutes_and_seconds(angle - angle.to_i)
  #binding.pry
  "#{degree}#{DEGREE}#{minutes.to_s.rjust(2, '0')}'#{seconds.to_s.rjust(2, '0')}\" "
end

## Examples ##
p dms(30)  == %(30°00'00")
p dms(76.73)  == %(76°43'48")
p dms(254.6)  == %(254°36'00")
p dms(93.034773)  == %(93°02'05")
p dms(0)  == %(0°00'00")
p dms(360)  == %(360°00'00") || dms(360) == %(0°00'00")

# note - LS solution has some things I missed:

=begin
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

=end


## Further Exploration ##

# Our solution returns the following results for inputs outside the range 0-360:

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms_LS(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees % 360}#{DEGREE}%02d'%02d"), minutes % 360, seconds % 360)
end

p dms_LS(400) == %(400°00'00")
p dms_LS(-40) == %(-40°00'00")
p dms_LS(-420) == %(-420°00'00")

p dms_LS(400) == %(40°00'00")
p dms_LS(-40) == %(320°00'00")
p dms_LS(-420) == %(300°00'00")