# HEY YOU!

# String#upcase! is a destructive method, 
# so why does this code print HEY you instead of HEY YOU? 
# Modify the code so that it produces the expected output.

## ORIGINAL CODE ##

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

## NEW CODE ##
def shout_out_to(name)
  upname = name.chars.map { |c| c.upcase! }.join
  puts 'HEY ' + upname
end

shout_out_to('you')

# or version 2:

def shout_out_to_v2(name)
  shout = "HEY #{name}"
  puts shout.upcase
end

shout_out_to_v2('you')

## EXPLANATION ##
# the mutating upcase! is being run over the elements in an array created via the chars method.
# those elements are distinct from the string that the elements were pulled from w/ Array#chars
# we could convert the values back to a string and save as a variable that we return, for ex.
