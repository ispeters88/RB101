# Practice Problem 1

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

def pp_1(array)
  array.sort { |val1, val2| val2.to_i <=> val1.to_i }
end

p pp_1(arr)