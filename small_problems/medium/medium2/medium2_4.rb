# Matching Parentheses?

# Write a method that takes a string as an argument, and returns true if all parentheses 
# in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

require "pry-byebug"

def balanced?(str)
  parens_only = str.delete("^(", "^)")
  paren_status = 0
  parens_only.chars.each do |char|
    char == '(' ? paren_status += 1 : paren_status -= 1
    return false if paren_status < 0
  end

  paren_status.zero?
end


## Examples ##
p balanced?('What (is) this?')#  == true
p balanced?('What is) this?')#  == false
p balanced?('What (is this?')#  == false
p balanced?('((What) (is this))?')#  == true
p balanced?('((What)) (is this))?')#  == false
p balanced?('Hey!')#  == true
p balanced?(')Hey!(')#  == false
p balanced?('What ((is))) up(')#  == false


## Data/Algorithm ##
# > Given a string, str - 
#     1) Create a new string, parens_only that contains only the '(' and ')' characters from str
#     2) Initialize an integer variable, paren_status, to 0
#     3) Iterate through the characters in parens_only
#           > On each iteration, if the character is a '(', add 1 to paren_status. Otherwise, subtract 1 from paren_status
#           > If paren_status is ever negative, return false
#     4) After iteration is complete, return true if paren_status is 0, false otherwise


## Further Exploration ##
# There are a few other characters that should be matching as well. 
# Square brackets and curly brackets normally come in pairs. 
# Quotation marks(single and double) also typically come in pairs and should be balanced. 
# Can you expand this method to take into account those characters?

# > Same concept, but use a hash for all the characters, instead of a single variable

def balanced_fe?(str)
  bal_chars = { ["{", "}"] => 0,
                ["(", ")"] => 0,
                ["[", "]"] => 0 }
  
  #binding.pry
  str.chars.each do |char|
    bal_chars.each do |brackets, total|
      if brackets.include?(char)
        char == brackets[0] ? bal_chars[brackets] += 1 : bal_chars[brackets] -= 1
        return false if bal_chars[brackets] < 0
      end
    end
  end
  str.count("'\"").even? && bal_chars.none? { |chars, total| total != 0 }
end

p "further exploration"
p balanced_fe?("{(()}]}")
p balanced_fe?("{{(')'}][}")
p balanced_fe?("{{(')'}[()}]")

# open_chars = { "(" => 0, "[" => 0, "{" => 0 }
# close_chars = { ")" => 0, "]" => 0, "}" => 0 }
# quotes = { "'" => 0, "\"" => 0 }
=begin
bal_chars = { /[{}]/ => { "{" => 0, "}" => 0 }, 
                /[()]/ => { "(" => 0, ")" => 0 },
                /[\[\]]/ => { "[" => 0, "]" => 0 },
                "'" => 0,
                "\"" => 0 }
=end

## first draft ##
# > this works fine with non-nested () pairs. Does not handle nested ()

# > Given a string, str - 
#     1) Create a new string that contains only the '(' and ')' characters from str
#     2) Initialize a variable, open, and set to false
#     3) Iterate through the characters in the string created in step #1
#         > On each iteration, do a check on both the current character value, and the current value of open
#         > If open = false and the current character is a ')', return false
#         > If open = true and the current character is a '(', return false
#         > otherwise, continue to next iteration
#     4) If end of iteration is reached, return true

#def balanced?(str)
#  open = false
#  binding.pry
#  str.delete("^(", "^)").chars.each do |char|
#    if (open && char == '(') || (!open && char == ')')
#      return false
#    else
#      open = !open
#    end
#  end
#  open = !open
#  open
#end