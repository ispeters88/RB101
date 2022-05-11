require "pry"
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# >> Expect nothing to happen. Greeting gets initialized via the if statement, but since it doesn't get set to anything, 
# it equals nil.