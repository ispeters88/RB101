# Sherlock on pockets
# * 29:03 *


# Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
# Suspect in this case is a person which has something not allowed in his/her pockets.
# 
# Allowed items are defined by array of numbers.
# 
# Pockets contents are defined by map entries where key is a person and value is one or few things represented 
# by an array of numbers (can be nil or empty array if empty), example:



# 
# Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), 
# the method should return nil.




## problem & data structures ##
# input - array
# output - array, or nil
# goal - find all the keys associated with 
# rules/reqs
#   1) input array contains integers

require "pry-byebug"

def suspect?(item, allowed_items)
  # accepts two arrays containing numbers - first array contains numbers of what an individual has, 2nd has 
  # numbers representing what is legal. Return true if any of the elements in the first array are not found in the second array

  !allowed_items.include?(item)
end


# return array of suspects with illegal items in their pockets
def find_suspects(pockets, allowed_items)
  suspects = Array.new
  
  pockets.each do |name, pocket_items|
    next if pocket_items.nil?
    pocket_items.each do |item|
      suspects << name if suspect?(item, allowed_items)
    end
  end

  suspects.empty? ? nil : suspects.uniq
end

## examples ##

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) # => nil
p find_suspects(pockets, []) # => [:bob, :tom, :jane]
p find_suspects(pockets, [7]) # => [:bob, :tom]


## algorithm ##
# Initialize a local variable suspects, to an empty Array object
# Iterate over the keys in the input hash pockets
#   > initialize over the values in the input array of alloable numbers
#       > check if the current value exists in the hash value for the current outer iteration key
#       > if so, add the key (as is) to suspects

# if the result is empty, return nil
# if any names (ie hash keys) are duplicated, remove the duplicates
