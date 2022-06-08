# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

answer = nil
index = 0

loop do 
  if flintstones[index].start_with?('Be')
    answer = index
  end
  index += 1
  break if index == flintstones.size
  answer
end

p answer

# Option 2

flintstones.index { |name| name.start_with?('Be') }