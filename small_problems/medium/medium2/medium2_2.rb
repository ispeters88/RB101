# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

BLOCK_HSH = { "B"=>"O", "X"=>"K", "D"=>"Q", "C"=>"P", "N"=>"A", "G"=>"T", "R"=>"E", 
              "F"=>"S", "J"=>"W", "H"=>"U", "V"=>"I", "L"=>"Y", "Z"=>"M" }

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. 
# Each block can only be used once.
# 
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, 
# false otherwise.


## Problem ##
# input - string
# output - boolean
# rules/reqs = given the rules listed below, return true if the input string follows the rules, false otherwise
#   1) the string can't contain both the key and value of a key/value pair from the letter block hash
#   2) the string can't contain the same letter twice

def block_word?(str)
  bool_arr = str.chars.map do |char|
    block_char = char.upcase
    partner = BLOCK_HSH.key?(block_char) ? BLOCK_HSH[block_char] : BLOCK_HSH.key(block_char)
    str.count(char) == 1 && !str.include?(partner)
  end.all?
end

## Examples ##
p block_word?('BATCH')# == true
p block_word?('BUTCH')# == false
p block_word?('jest')# == true


## Data/Algorithm ##
# > Given a string, str - 
#     1) Create an array with the letters in str
#         > perhaps validate they are all letters?
#     2) Iterate through the letter array, convert each value to a boolean
#     3) Remove all true values
#     4) check size of result array - 
#         > return true if size is 0
#         > return false otherwise
#     >> maybe use all? or any?