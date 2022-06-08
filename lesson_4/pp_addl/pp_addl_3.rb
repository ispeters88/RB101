# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

## Answer ##
# >> The solution below assumes that the problem is asking for the original hash to be mutated, rather than return a new
# hash. This would be an important question to ask in an assessment or interview context
##        ##

ages.delete_if { |key, val| val >= 100 }