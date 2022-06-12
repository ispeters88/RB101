# Mutation

# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

## Answer ##

'Moe'
'Larry'
'CURLY'
'SHEMP'
'Harpo'
'CHICO'
'Groucho'
'Zeppo'

# > When the values from array1 are pushed onto array2, we are are adding references to the values those elements hold
# in memory, to array2. When we use the #upcase! method to mutate those values, we see the results in array2 as well, 
# since array2 is pointing to the same elements that got mutated