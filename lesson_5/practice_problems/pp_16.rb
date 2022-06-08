# Practice Problem 16

# A UUID is a type of identifier often used as a way to uniquely identify items...
# which may not all be created by the same system. 
# That is, without any form of synchronization, two or more separate computer systems can create new items and 
# label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 
# 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

DASH_LOCATIONS = [8, 13, 18, 23]

def uuid
  id_string = ''
  length = 0

  while length < 36
    if DASH_LOCATIONS.include?(length)
      id_string << '-'
    else
      id_string << rand(0..15).to_s(16)
    end
    length += 1
  end

  id_string
end

10.times do
  p uuid
end