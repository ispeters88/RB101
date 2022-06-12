# Tip calculator

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

## Problem ##
# input - two numerics, user supplied
# output - print two values to the console
# requirements/rules
#   1) prompt user for two values - bill amount and tip rate
#   2) compute the tip based on these values
#   3) display the tip, and the total bill
# questions
#   1) can we assume we should use floats rounded to 2 digits?
#   2) can we assume the input is validated?

## Example ##

=begin
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

## Data/Algorithm ##
#   1) Ask user for input - bill amount, and tip percentage
#   2) Calculate tip amount
#   3) Calculate total bill amount (tip + bill)
#   4) Print both values to the console
# note - in my solution, I assume the bill amt is a 2-digit rounded float, and the tip percentage is an integer

def get_bill
  puts "What is the bill?"
  bill = gets.chomp.to_f.round(2)
  puts "What is the tip percentage?"
  tip = gets.chomp.to_f.round(2) / 100
  [bill, tip]
end

bill_amt, tip_pct = get_bill
tip_amt = (bill_amt * tip_pct).round(2)

puts "The tip is $#{tip_amt}"
puts "The total is $#{bill_amt + tip_amt}"