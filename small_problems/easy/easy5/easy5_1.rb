# ASCII String Value

# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. 
# The ASCII string value is the sum of the ASCII values of every character in the string. 
# (You may use String#ord to determine the ASCII value of a character.)


def ascii_value(str)
  str.chars.inject(0) { |sum, char| sum + char.ord }
end

def ascii_value_2(str)
  str.chars.map { |ch| ch.ord }.sum
end

def ascii_value_3(str)
  idx = 0
  sum = 0
  loop do
    break if idx == str.length
    sum += str[idx].ord
    idx += 1
  end
  sum
end


## Examples ##
p ascii_value_3('Four score') #== 984
p ascii_value_3('Launch School') #== 1251
p ascii_value_3('a') #== 97
p ascii_value_3('') #== 0



## Further Exploration ##
# There is an Integer method such that
#     char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? 
# What happens if you try this with a longer string instead of a single character?

# > "mystery" method is Integer#chr
# > String#ord takes a single character string as input. If it is called on a multiple character string, only the first
# character is converted to its ASCII value