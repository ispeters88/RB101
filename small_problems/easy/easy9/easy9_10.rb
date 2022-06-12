# Grocery List


# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.


def buy_fruit(arr)
  list = Array.new
  arr.each do |item, count|
    count.times do 
      list << item 
    end
  end
  list
end


## Examples ##
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit_short(arr)
  arr.map { |item, count| [item] * count }.flatten
end

p buy_fruit_short([["apples", 3], ["orange", 1], ["bananas", 2]])