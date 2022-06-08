#Data structures
#	Create sequence using 2D array
#	Pass in integer, representing the row number to sum
#	Return integer, sum of values in requested row
#Algorithm
#	Create sequence (array)
#		Create empty results array
#		Set variable current_val = 2
#		From 0 to (row number - 1):
#			Create row
#			Add row to results array
#	Locate row identified by row number (row number - 1 to account for array indexing)
#	Return sum of values in that row

require "pry"

sequence = Array.new(0)

def sum_row(row_num, start_num = 2, increment = 2)
  sequence = create_seq(start_num, row_num, increment)
  sequence[row_num - 1].sum
end

def create_seq(start_num, row_num, increment = 2)
  sequence = Array.new(0)
  cur_start = start_num
  (1..row_num).each do |row| 
    sequence << create_row(cur_start, row)
    cur_start += (increment * row)
    #binding.pry
  end
  sequence
end

def create_row(start_num, row_num, increment = 2)
  row = Array.new(0)
  cur_num = start_num
  (1..row_num).each do
    row << cur_num
    cur_num += increment
    #binding.pry
  end
  row
end

p sum_row(4) == 68
p sum_row(3) == 30
p sum_row(1) == 2

#p create_seq(2, 3)