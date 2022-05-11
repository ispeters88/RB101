# One day Spot was playing with the Munster family's home computer 
# and he wrote a small program to mess with their demographic data:

require "pry"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
binding.pry

# Did the family's data get ransacked? Why or why not?

# >> Yes - the age of each family member is increased by 42, and the gender is set to "other"
# This is because hash element assignment using Hash#[] is mutating with respect to the element
# (but not mutating with respect to the hash itself)

