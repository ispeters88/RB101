# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given by an argument. 
# You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
# and that it will remain in use for the foreseeable future.

require "pry-byebug"

MONTHS = { "Jan" => 31, "Feb" => 28, "Mar" => 31, "Apr" => 30, "May" => 31, "Jun" => 30,
           "Jul" => 31, "Aug" => 31, "Sep" => 30, "Oct" => 31, "Nov" => 30, "Dec" => 31 }

DAYS = %w(Sun Mon Tue Wed Thu Fri Sat)
ROOT_DAY = 1
ROOT_YEAR = 1753
UNLUCKY_DAY = 13
FROM_FIRST_TO_13TH = UNLUCKY_DAY % 7

def leap_year?(yr)
  yr % 4 == 0 && !(yr % 100 == 0 && yr % 400 != 0)
end

def get_elapsed_days(year)
  days = 0
  ROOT_YEAR.upto(year - 1) do |yr|
    leap_year?(yr) ? days += 366 : days += 365
  end
  days
end

def get_first_day(year)
  days = get_elapsed_days(year)
  ROOT_DAY + days % 7
end

def friday_13th_brute(year)
  day_index = get_first_day(year)
  #binding.pry
  unlucky_days = Hash.new(0)
  MONTHS.each do |month, day_count|
    day_index = (day_index - 2) % 7
    unlucky_days[month] = DAYS[day_index]
    day_count += 1 if month == "Feb" && leap_year?(year)
    day_index = (day_index + day_count - UNLUCKY_DAY + 1) % 7
  end

  unlucky_days.select { |month, day| day == "Fri" }.size
end

## Examples ##
# p friday_13th_brute(2015)#  == 3
# p friday_13th_brute(1986)#  == 1
# p friday_13th_brute(2019)#  == 2


## Data/Algorithm ##
# > Given an integer greater than 1752, year - 
#     1) Get day of the week of Jan 1 of year
#     2) cycle through months, storing off the weekday of the 13th of each month
#     3) add the total number of Fridays that are linked to the 13th

#     Count up from Monday, 1/1/1753



## Second attempt, using Date class ##

## Data/Algorithm ##
# > Given an integer greater than 1752, year - 
#     1) Initialize a variable of class Date representing Jan 13th of year
#     2) Initialize an integer, unlucky_days, and set to 0
#     3) Iterate over each month of the year
#         > On each iteration, add the key/value pair month => weekday of 13th, to the unlucky_days hash
#         > Then update the Date variable to be the 13th of the next month

require 'date'

def friday_13th(year)
  unlucky_days = 0
  unlucky = Date.civil(year, 1, 13)
  12.times do
    unlucky_days += 1 if unlucky.friday?
    unlucky = unlucky >> 1
  end
  unlucky_days
end

p friday_13th(2015)#  == 3
p friday_13th(1986)#  == 1
p friday_13th(2019)#  == 2



## Further Exploration ##

# An interesting variation on this problem is to count the number of months that have five Fridays. 
# This one is harder than it sounds since you must account for leap years.

## Data/Algorithm ##
# > Given an integer greater than 1752, year - 
#     1) Initialize a variable of class Date representing Jan 1 of year
#     2) Iterate over months of the year 

def friday_13th_fe(year)
  start = Date.new(year)
  stop = Date.new(year, -1, -1)
  friday_counts = Hash.new(0)
  
  start.step(stop).each do |date|
    friday_counts[date.month] += 1 if date.friday?
  end

  friday_counts.select { |_, count| count == 5 }.size

end


p friday_13th_fe(2015)
p friday_13th_fe(1986)
p friday_13th_fe(2019)