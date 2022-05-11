require "pry"

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

#see if "Spot" is present.

# >>

answer = ages.include?("Spot")
puts "Spot is present is: #{answer}"

# Bonus: What are two other hash methods that would work just as well for this solution?

answer_2 = ages.member?("Spot")
answer_3 = ages.has_key?("Spot")
answer_4 = ages.any? { |key, val| key == "Spot" }

binding.pry