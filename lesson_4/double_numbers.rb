def double_numbers!(num_arr)
  counter = 0

  loop do
    num_arr[counter] *= 2
    counter += 1
    break if counter == num_arr.size
  end
end

num_arr = [1, 2, 3, 4, 5]
p num_arr
double_numbers!(num_arr)
p num_arr