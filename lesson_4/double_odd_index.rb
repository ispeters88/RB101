def double_odd_index!(num_arr)
  index = 0

  loop do
    num_arr[index] *= 2 if index.odd?
    index += 1
    break if index == num_arr.size
  end
end

num_arr = [1, 2, 3, 4, 5]
p num_arr
double_odd_index!(num_arr)
p num_arr