# 6. (part 4, first problem)

# *15:48 *
=begin
Given 2 strings, find out if there is a substring that appears in both strings. 
Return true if you find a substring that appears in both strings, or false if not. 
Only consider substrings that are longer than one letter long. 

=end 


## problem & data structures ##
# input - two string objects
# output - a boolean
# rules/reqs
#   1) return true if at least one substring with length > 1 is contained in both input strings
#   2) return false otherwise
#   3) input strings can be different length (implicit)
#   4) input strings can be empty


def get_all_substrings(string)
  substrings = Array.new

  (0...string.length).each do |i|
    (2..string.length - i).each do |k|
      substrings << string.slice(i, k)
    end
  end

  substrings
end

require "pry-byebug"

def substr_test(str1, str2)
  #binding.pry
  shorter, longer = str1.length > str2.length ? [str2, str1] : [str1, str2]
  substrings = get_all_substrings(shorter)

  substrings.each do |substring|
    return true if longer.include?(substring)
  end

  false
end


## examples ##
p substr_test('Something', 'Fun')  == false 
p substr_test('Something', 'Home')  == true
p substr_test('Something', '')  == false
p substr_test('', 'Something')  == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

## algorithm ##
#
# Find and store off all substrings, with length > 2
#

# Initialize a local var substrings, to an empty Array object

# Iterate from 0 to length of shorter of the 2 input strings (iter variable i)
#     > iterate from 2 to length of the shorter of two input strings (iter variable len)
#       > get slice of shorter string - string.slice(i, len)
#       > add slice to substrings array

# Iterate through each substring; on each iteration:
#   > check if the current substring is contained in both input strings
#     built in method? -- include?
# 
#   > if so, return true
#  If iteration completes, return false