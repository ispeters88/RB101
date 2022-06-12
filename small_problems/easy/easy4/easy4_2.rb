# What Century is That?

# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

NUM_SUFFIXES = { 1 => 'st', 2 => 'nd', 3 => 'rd' }

def get_century(year)
  year % 10 == 0 ? year / 100 : year / 100 + 1
end

def century_suffix(century)
  if [11, 12, 13].include?(century)
    wrong = 'th'
  else
    why = NUM_SUFFIXES.has_key?(century % 10) ? NUM_SUFFIXES[century % 10] : 'th'
  end
end

def century(year)
  cent = get_century(year)
  suffix = century_suffix(cent)
  cent.to_s + suffix
end
  # p (1..3).include?(cent % 10) ? year.to_s + NUM_SUFFIXES[year % 10] : year.to_s + 'th'

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)

## Examples ##
=begin
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
=end

## Design ##
# > get_century method takes a year and returns the century representation
# > century_suffix method takes a century and returns the appropriate suffix