# Staggered Caps (Part 2)

# Modify the method from the previous exercise so it ignores non-alphabetic characters 
# when determining whether it should uppercase or lowercase each letter. 
# The non-alphabetic characters should still be included in the return value; 
# they just don't count when toggling the desired case.

require "pry-byebug"

def staggered_case(str)
  stag_str = ''
  make_upper = true

  str.chars.each do |char|
    stag_str += (make_upper ? char.upcase : char.downcase)
    make_upper = !make_upper if char.match?(/[A-Za-z]/)
  end
  stag_str
end

## Examples ##
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


## Further Exploration ##
# Modify this method so the caller can determine whether non-alphabetic characters should be counted 
# when determining the upper/lowercase state. 
# That is, you want a method that can perform the same actions that this method does, 
# or operates like the previous version.
# 
# Hint: Use a keyword argument.

def staggered_case_fe(str, ignore=true)
  stag_str = ''
  make_upper = true

  str.chars.each do |char|
    stag_str += (make_upper ? char.upcase : char.downcase)
    make_upper = !make_upper if !ignore || char.match?(/[A-Za-z]/)
  end
  stag_str
end

## Examples ##
p staggered_case_fe('I Love Launch School!')# == 'I lOvE lAuNcH sChOoL!'
p staggered_case_fe('ALL CAPS')# == 'AlL cApS'
p staggered_case_fe('ignore 77 the 444 numbers', false)# == 'IgNoRe 77 ThE 444 nUmBeRs'