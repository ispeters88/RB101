# Odd Numbers

# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).each { |num| puts num if num.odd? }

# further exploration
# * seems odd to not use a range here, but will try:

num = 1
num_arr = Array.new(0)
99.times do |num| 
  num_arr << num
  num += 1
end

num_arr.select { |num| puts num if num.odd? }