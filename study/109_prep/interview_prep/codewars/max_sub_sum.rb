require "pry-byebug"

def max_sequence(arr)
  return 0 if arr.empty?
  subseqs = Array.new
  size = arr.size
  binding.pry
  arr.each_index do |idx|
    size.times do |num|
      subseqs << arr[idx..num]
    end
  end
  
  subseqs.map(&:sum).max
end

max_sequence([11])