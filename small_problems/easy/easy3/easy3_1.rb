# Searching 101

# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def prompt(msg)
  puts "==> #{msg}"
end

def get_numbers
  num_arr = Array.new(0)

  (1..5).each do |num|
    
    loop do
      prompt "Enter number #{num}:"
      input = Integer(gets) rescue nil
      if input != nil
        num_arr << input
        break
      else prompt "Thats not a valid integer!"
      end
    end
  
  end
  num_arr
end

first_five_arr = get_numbers

final = nil

loop do
  prompt "Enter the last number"
  if final = Integer(gets) rescue nil
    break
  else
    prompt "That is not a valid integer!"
  end
end

puts final
if first_five_arr.include?(final)
  include_status = 'appears'
else
  include_status = 'does not appear'
end

puts "The number #{final} #{include_status} in #{first_five_arr}"

## Problem ##
# input - 6 numbers, user supplied
# output - (string) message to console
# requirements
#   1) user input should be requested 5 times. Each time, the supplied input should be added to an array
#   2) use basic validation
# questions
#   1) what sort of validation can we assume?


## Example ##
=begin

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

=end

## Data/Algorithm ##
#   1) get user input 5 times. Place each input value into an array
#   2) After the 6th input, check if the 6th input is in the array
#   3) Display a message stating whether or not the 6th input is contained in the arraay