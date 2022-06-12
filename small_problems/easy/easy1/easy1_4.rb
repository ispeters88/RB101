# How Many?

# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. 
# Once counted, print each element alongside the number of occurrences.


def count_occurrences_no_hash(items)
  items.uniq.each { |item| puts "#{item} => #{items.count(item)}"}
end

def count_occurrences(items)
  item_hsh = Hash.new(0)
  items.each { |item| item_hsh[item] += 1 }
  item_hsh.each do |item, count|
    puts "#{item} => #{count}"
  end
end

# Further exploration

def count_occurrences_case_insensitive(items)
  item_hsh = Hash.new(0)
  items.each do |item|
    item_hsh[item.downcase] += 1
  end
  item_hsh.each do |item, count|
    puts "#{item} => #{count}"
  end
end

def count_occurrences_case_insensitive2(items)
  items.map!(&:downcase).uniq.each do |item|
    puts "#{item} => #{items.count(item)}"
  end
end

## Problem ##
# input - array
# output - output to console, each unique element from array, with corresponding integer count
# requirements - 
#   1) words are case sensitive: 'suv' != 'SUV'
# questions

## Examples ##

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

## Data/Algorithm ##
# Array
# Output contents of hash to console
# > Given an array, items_arr
#     1) Initialize an empty hash, item_hsh 
#     2) Iterate over the items in the array one by one
#     3) If an item is already in item_hsh, increment its value by 1. Otherwise, add it to item_hsh with a value of 1
#     4) Output each key/value pair from item_hsh to the console