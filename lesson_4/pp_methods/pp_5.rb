# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

## Answer ##

# >> The #shift method removes the first key-value pair in the hash, and returns them as a two-item array:
# [:a, 'ant']
# We can confirm this by consulting the ruby documentation