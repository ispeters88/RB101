# Challenge: write a method that changes strings in the date format 2016-06-17 to the format 17.06.2016. 
# You must use a regular expression and should use methods described in this section.

def format_date(str)
  transform = /\A(\d{4})\-(\d{2})\-(\d{2})\z/
  str.sub(transform,'\3.\2.\1.')
end


## Examples ##

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)