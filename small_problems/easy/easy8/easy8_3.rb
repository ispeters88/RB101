# Leading Substrings

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. 
# The return value should be arranged in order from shortest to longest substring.

def leading_substrings(string)
  substrings = Array.new
  string.chars.each_index do |idx|
    substrings << string[0..idx]
  end

  substrings.sort { |a, b| a.size <=> b.size }
end




## examples ##
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']