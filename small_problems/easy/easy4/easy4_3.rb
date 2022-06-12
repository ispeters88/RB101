# Leap Years (Part 1)

=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, 
unless the year is also divisible by 100. If the year is evenly divisible by 100, 
then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. 
Write a method that takes any year greater than 0 as input, 
and returns true if the year is a leap year, or false if it is not a leap year.
=end

def leap_year?(year)
  year % 4 == 0 && !(year % 100 == 0 && !(year % 400 == 0))
end

## Problem ##
# input - positive integer
# output - boolean
# requirements/rules
#   1) leap year if year is divisible by 4, unless year is divisible by 100 but not 400
#   2) input is a year greater than 0
# questions

## Examples ## 
p leap_year?(2016) #== true
p leap_year?(2015) #== false
p leap_year?(2100) #== false
p leap_year?(2400) #== true
p leap_year?(240000) #== true
p leap_year?(240001) #== false
p leap_year?(2000) #== true
p leap_year?(1900) #== false
p leap_year?(1752) #== true
p leap_year?(1700) #== false
p leap_year?(1) #== false
p leap_year?(100) #== false
p leap_year?(400) #== true


## Further exploration ##

# rewrite leap_year? (the long way) so that it follows the opposite order from the LS suggested solution, ie

# That is, test whether the year is divisible by 4 first, then, if necessary, 
# test whether it is divisible by 100, and finally, if necessary, test whether it is divisible by 400. 

def leap_year_further(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return true
      else
        return false
      end
    end
  else
    return false
  end
end



# Is this solution simpler or more complex than the original solution?

# I find this to be much more complex from a reading comprehension standpoint. I don't know at this point if it is more or less
# complex from the standpoint of performance, etc. It just sucks to look at, IMO. 