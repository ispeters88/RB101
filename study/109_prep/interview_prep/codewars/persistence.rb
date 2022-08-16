# Persistent Bugger
# 
# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, 
# which is the number of times you must multiply the digits in num until you reach a single digit.


def persistence(n)
  product = n.digits.inject(&:*)
  return 0 if product.digits.size == 1
  persistence_cnt = 1
  loop do
    return persistence_cnt if product.digits.size == 1
    persistence_cnt += 1
    product = product.digits.inject(&:*)
  end
end

## examples ##
p persistence(39)    # == 3
p persistence(4)     # == 0
p persistence(25)    # == 2
p persistence(999)   # == 4
p persistence(444)   # == 3
p persistence(26996)
p persistence(0)


## algorithm ##
# Set an initial product value to the product of the digits of n
# Set a persistence count to 1
# Start indefinite iteration
#   > Return the persistence count if the product value has 1 digit
#   > Increment the persistence count by 1
#   > Set the product value to the product value of the digits of the product value