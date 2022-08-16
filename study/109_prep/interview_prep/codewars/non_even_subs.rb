# Non-even substrings
# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# 
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
# 
# solve("1341") = 7. See test cases for more examples.
# 
# Good luck!



## problem ##
# input - string
# output - integer
# rules/reqs - 
#   1) each character in input string is an integer
#   2) output value should be a count of all possible substrings of the input string that are odd when converted
#      to an integer
#   3) duplicated "substrings" are included if a number is present > 1 time

def get_all_substrings(array)
  i = 0
  size = array.size
  all_subs = Array.new

  loop do
    k = i
    loop do
      all_subs << array[i..k]
      k += 1
      break if k == size
    end
    i += 1
    break if i == size
  end

  all_subs
end

def get_all_subs(array)
  size = array.size
  all_subs = Array.new

  (0...size).each do |i|
    (i...size).each do |k|
      all_subs << array[i..k]
    end
  end
  all_subs
end


def non_even_subs(str)
  digits = str.chars
  all_subs = get_all_subs(digits)

  all_subs.map { |subarr| subarr.join.to_i }.count(&:odd?)
end


## examples ##

p non_even_subs("1341")
p non_even_subs("0")
p non_even_subs("1357")# ,10)
p non_even_subs("13471")# ,12)
p non_even_subs("134721")# ,13)
p non_even_subs("1347231")# ,20)
p non_even_subs("13472315")# ,28)


## algorithm ##
# Split input string into an array of characters
# Find all possible subarray combinations of array of characters
# Convert each subarray into an integer number
# Count up all the integer numbers that are odd

# Get all substrings
# Initialize an empty array object, and two counter variables _i_ and _k_ (both to 0)
# Nested iteration over the input array - 
#   > On inner iteration, count up k from i to size of array. Add slices of array into results array, then incremenent k
#   > On inner iteration, increment i