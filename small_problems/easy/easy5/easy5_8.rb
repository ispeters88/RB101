# Alphabetical Numbers


# Write a method that takes an Array of Integers between 0 and 19, 
# and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, 
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 
'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(num_arr)
  sorted_words = num_arr.map { |num| NUMBER_WORDS[num] }.sort
  sorted_words.map { |word| NUMBER_WORDS.index(word) }
end

# LS solution is nicer: 
def alphabetic_number_sort_LS(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end


## Problem ##
# 
# questions 
#   1) "sorted based on the english words" - does this mean, in the order specified? in alphabetic order? etc
#       ** Provided example implies that it should be alphabetic order. My solution will assume this is the case


## Example ##

p alphabetic_number_sort((0..19).to_a) #== [
#  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#  6, 16, 10, 13, 3, 12, 2, 0
#]


## Further Exploration ##
# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
#     > There is no need to mutate the array with #sort_by!

# For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).
#     > (Already done in initial solution)

def alphabetic_number_sort_LS_mutate(numbers)
  numbers.sort_by! { |number| NUMBER_WORDS[number] }
end


p alphabetic_number_sort_LS_mutate((0..19).to_a)