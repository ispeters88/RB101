# When will I Retire?

# Build a program that displays when the user will retire and 
# how many years she has to work till retirement.

# Problem ##
# input - 
# output - 
# requirements/rules
#   1) 
# questions

## Example ##

=begin
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

## Data/Algorithm ##
#   1) Get current age and retirement age via user supplied input
#   2) Calculate the expected year of retirement and the remaining years
#   3) Output both to the console

def get_retirement_details
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "At what age would you like to retire?"
  retire = gets.chomp.to_i
  [age, retire]
end

current_year = Time.now.year
age_current, age_retirement = get_retirement_details

years_left = age_retirement - age_current

puts "It's #{current_year}. You will retire in #{current_year + years_left}"
puts "You have only #{years_left} years of work to go!"