=begin
str = 'The grass is green'

puts str[4, 5]
puts str.slice(4, 5)
puts str[str.index('grass'), str.length][0, 5]

# strings are not true collections. One string is a single object, and pulling out one or more characters from that
# object returns a new String object with the requested characters. 
# True collections - (singleton) indexing into the collection returns the same object that lives in the collection.
char1 = str[2]                     # => "c"
char2 = str[2]                     # => "c"
char1.object_id == char2.object_id # => false

# What do you think would be returned here? Try it out in irb.

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]

# >> 
# arr[2, 3] = ['c', 'd', 'e']
# arr [2, 3][0] = 'c'

arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"


# hashes

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"


# use of Hash#keys and Hash#values
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"


# using negative indices
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
# returns nil
arr[-6]
# returns nil

# use of Hash#fetch

hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'

# conversions

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

# to get back to the original string with spaces
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join(' ')

# string element assignment

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

# How do we change the first letter of each word to uppercase?

# >> 


puts str.split.each { |word| word.capitalize! }.join(' ')
puts str

# hash reassignment

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'

=end

loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end