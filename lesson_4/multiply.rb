def multiply(num_arr, mult)
  counter = 0
  mult_arr = Array.new(0)

  loop do
    mult_arr[counter] = num_arr[counter] * mult
    counter += 1
    break if counter == num_arr.size
  end
  mult_arr
end

num_arr = [1, 2, 3, 4, 5]
p num_arr
p multiply(num_arr, 5)