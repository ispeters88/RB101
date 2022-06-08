# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

## Answer ##

flintstones_hsh = Hash.new(0)
index = 0

loop do
  flintstones_hsh[flintstones[index]] = index
  index += 1
  break if index == flintstones.size
end

p flintstones_hsh

# Option 2

fs_hsh = Hash.new(0)
idx = 0

flintstones.each_with_object({}) do |name, hsh|
  fs_hsh[name] = flintstones.index(name)
end

p fs_hsh

# Option 3

fs_hsh = Hash.new(0)
flintstones.each_with_index do |name, index|
  fs_hsh[name] = index
end