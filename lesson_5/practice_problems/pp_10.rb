# Practice Problem 10

# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.


arr_old = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

def pp_10(arr)
  arr.map do |hsh|
    hsh.map do |key, val|
      [key, val + 1]
    end
    .to_h
  end
end

p pp_10(arr_old)
p arr_old