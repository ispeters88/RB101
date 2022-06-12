# Palindromic Numbers

# Write a method that returns true if its integer argument is palindromic, false otherwise. 
# A palindromic number reads the same forwards and backwards.


def is_palindrome?(char_array)
  char_array == char_array.reverse
end

def palindromic_number?(num)
  is_palindrome?(num.digits)
end


## Examples ##

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true


## Further Exploration ##
# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

# > The method will not work if the number begins with one or more 0s. Integers cannot have leading 0s; ruby interprets numbera
# w/ leading 0s as octal numbers rather than decimal. We could use "#%o" or Kernel#sprintf to convert a number with leading 
# 0s into a string representing an integer with the leading 0s removed, but then our method would *only* work for octal numbers
# There is no reliable way to have the palindromic_number? method accept both true integers, and octal numbers (numebers with
# leading 0s), and treat both appropriately. 
# >> One solution would be to have the numbers entered in string format. This would prevent the interpreter from converting 
# the "integer" with leading 0s, into its octal format.