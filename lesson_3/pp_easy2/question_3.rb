# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

RESET = ages

# 1

additional_ages.each { |key, val| ages[key] = val }
puts ages
ages = RESET

# 2

ages.merge!(additional_ages)
puts ages
ages = RESET