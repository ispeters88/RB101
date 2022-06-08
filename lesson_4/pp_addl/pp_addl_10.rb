# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key 
# that has one of three values describing the age group the family member is in (kid, adult, or senior). 
# Your solution should produce the hash below

## Problem ##
# input - hash
# output - hash (implied to be the same one, see questions below)
# requirements
#   1) The input hash is a 2D nested hash, where the values of the outer hash are all hashes with 2 k/v pairs
#   2) The returned hash should have 1 additional key-value pair (for total of 3). The additional should be added to the end of
#     the existing pairs
#   3) The new key is "age-group". The corresponding value should be one of : 'kid', 'adult', senior'. Age ranges are
#           0 - 17 : kid
#           18 - 64: adult
#           65 + : senior
# questions
#   1) 

## Examples ##

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

## Data structures and Algorithm ##
# I/O: both are 2D hashes. The outer hash values for the I hash have 2 K/V pairs. These outer hash values for the O hash
# have 3 K/V pairs
# Algorithm
#  Given a 2D hash, family - 
#   1) Iterate over the hash values
#   2) Mutate each value (which is a hash itself), by adding a 3rd key/value pair. 
#       2a) The key is age_group
#       2b) The value is dependent on the value associated with the "age" key:
#           0 - 17 : kid
#           18 - 64: adult
#           65 + : senior

munsters.each_value do |hsh|
  case hsh["age"]
    when (0..17) then hsh["age_group"] = "kid"
    when (18..64) then hsh["age_group"] = "adult"
    else hsh["age_group"] = "senior"
  end
end

p munsters