# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

=begin
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
=end


# make a copy that we can reset to later
RESET = munsters_description

# 1) "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.swapcase!
puts munsters_description
munsters_description = RESET

# 2) "The munsters are creepy in a good way."

munsters_description.capitalize!
puts munsters_description
munsters_description = RESET

# 3) "the munsters are creepy in a good way."

munsters_description.downcase!
puts munsters_description
munsters_description = RESET

# 4) "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.upcase!
puts munsters_description