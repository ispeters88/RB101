# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# >> The hash { a: 'hi there' } is printed to the console
# On line #2, we are assigning a reference to the location in memory where the value of the greetings hash at key :a lives.
# Then on line #3, we are mutating the object that reference points to. 
# Therefore, greetings[:a] becomes "hi there"