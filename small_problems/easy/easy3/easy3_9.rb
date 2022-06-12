# Palindromic Strings (Part 2)

=begin 
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.
=end


def is_palindrome?(char_array)
  char_array == char_array.reverse
end

def valid_char?(character)
  valid_chars = ('a'..'z').to_a + ('0'..'9').to_a
  valid_chars.include?(character)
end

def real_palindrome?(str)
  #is_palindrome?(str.downcase.chars.keep_if { |char| valid_char?(char) }.to_s)
  is_palindrome?(str.downcase.chars.keep_if { |char| valid_char?(char) })
end

# LS suggested solution uses String#delete. Argument form for this method is a bit confusing
#  Can enter one or multiple ranges of characters, and ^ character at beginning "negates" the condition - therefore, 
#     '^a-z0-9' - means NOT one of a-z or 0-9
def real_palindrome_with_delete?(str)
  simpler = str.downcase.delete('^a-z0-9')
  is_palindrome?(simpler)
end

## Examples ##
p real_palindrome_with_delete?('madam') #== true
p real_palindrome_with_delete?('Madam') #== true           # (case does not matter)
p real_palindrome_with_delete?("Madam, I'm Adam") #== true # (only alphanumerics matter)
p real_palindrome_with_delete?('356653') #== true
p real_palindrome_with_delete?('356a653') #== true
p real_palindrome_with_delete?('123ab321') #== false