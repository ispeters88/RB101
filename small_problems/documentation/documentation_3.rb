# Default Arguments in the Middle

# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.

## Note ##
# Consulted the Methods page (docs.ruby-lang.org) and the Calling Methods page (ruby-doc.org):
#     https://docs.ruby-lang.org/en/2.7.0/syntax/methods_rdoc.html
#     https://ruby-doc.org/core-2.5.0/doc/syntax/calling_methods_rdoc.html

## Answer ##
[4, 5, 3, 6]
##        ##