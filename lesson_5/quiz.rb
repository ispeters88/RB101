=begin
# Question 1

arr = ['340', '15', '1', '3400']

arr.sort # => ['1', '15', '340', '3400']


####################################################
# Question 2
# For this arr,
[a, b, c, d]
# we have
a <=> b # => -1
c <=> b # => 0
d <=> c # => 1

# This implies a < b, b = c, and c < d
# > Therefore, the array is already sorted. The return after a sort is the same order, [a, b, c, d]

####################################################
# Question 3

# Given the code below, select all the valid ways to return the value for the hash key :three.

arr = [
  {one: '1', two: 2},
  [{four: 5, three: 6}, :three],
  :three,
  {2=>:two, 3=>:three}
]

# > Just one way:
# arr[1][0][:three]
# >> Other options offered are:
# > arr[1][1]
#   This returns the symbol :three (standalone array value, not a hash key)
# > arr[2]
#   This returns the symbol :three (standalone array value, not a hash key)
# > arr[3][3]
#   This returns the symbol :three (hash value, not a hash key)

####################################################
# Question 4

# Given the following nested data structure, and without running the code, 
# select the correct option to change the string 'Apple Juice' to 'Orange Juice'.

todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  }
]

# Options are:

# 1)
todo_lists[0][:todos][2] = 'Orange Juice'
# >> This will change the third item in the todos array to the value 'Orange Juice', which is not what we want

# 2)
todo_lists[1][:todos][3][:name] = 'Orange Juice'
# >> This will return nil, as todo_lists is an array with only 1 item (a hash with addl nested hash/array structures)

# 3)
todo_lists[0][:todos][2][:name] = 'Orange Juice'
# >> This will update the value 'Apple Juice', to 'Orange Juice', which is the required result

#4) 
todo_lists[:todos][2][:name] = 'Orange Juice'
# >> This will throw an exception, as todo_lists[:todos] is not a valid element element reference for todo_lists, 
# which is an array

## Answer is #3 ##

####################################################
# Question 5
# Given the following nested data structure, and without running the code, 
# select all the options that would set the value for :completed to true for all of the todos in the 'Homework' list.

todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

# Options are:
# 1)
todo_lists[1].each do |list_key, list_value|
  if list_key == :todos
    list_value.each { |todo| todo[:completed] = true }
  end
end
# >> This achieves the required result **
p todo_lists[1]

# 2)
todo_lists[1][:todos][0][:completed] = true
todo_lists[1][:todos][1][:completed] = true
# >> This achieves the required result
p todo_lists[1]

#3) 
todo_lists.each do |list|
  if list[:list_name] == 'Homework'
    list[:todos].each do |todo|
      todo[:completed] = true
    end
  end
end
# >> This achieves the requested result
p todo_lists[1]

#4) 
todo_lists[1][:todos].each do |todo|
  todo[:completed] = true
end
# >> This achieves the requested result
p todo_lists[1]

=end
####################################################
# Question 6
# Without running the code attempt to work out what the last three lines will output.

a = 'hi'
english_greetings = ['hello', a, 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'
# english_greetings is now ['hello', 'hey', 'good morning']
# > The 2nd item in this array was replaced by a new value, 'hey'. Variable a remains unchanged

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end
# greetings hash is now:
=begin
{
  french: ['BONJOUR', 'SALUT', 'ALLO'],
  english: ['HELLO', 'HEY', 'GOOD MORNING'],
  italian: ['BUONGIORNO', 'BUONASERA', 'CIOA']
}


puts a
puts english_greetings[1]
puts greetings[:english][1]

####################################################
# Question 7

# Examine closely the following code:

def q_7
  [['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
    sub_arr.map do |letter|
      letter.upcase
    end
  end
end

=end
####################################################
# Questions 8-10

# Your team is working on some reporting functionality for the Sales Department. 
# Your brief is to produce code that lets the Sales Department report on the value of orders per customer. 
# Each order is represented by a hash within an array, but there may be more than one order per customer. 
# The Sales Department wants to report two things:

# The total value of orders for each customer
# The total value of fulfilled orders for each customer

# This is an example of the provided data:

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

# Restructured data should look like this:

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

# Question 7
## >> Options
# 1) In this one we are adding the order_fulfilled and order_value data as arrays, rather than hashes
# 2) In this one, once we have already added a customer, all subsequent entries for that customer override the 
#    initial value, so we wind up with the last set of values found in the original data
# 3) This one returns the required result
# 4) This one does not condense the data for a single customer as requested

# Question 8
## >> Options
# 1) This one returns the required result
# 2) This one returns the required result
# 3) This one returns the required result
# 4) This one adds the customer data in as a 2D array, rather than an array of hash objects


fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    # total + order[:order_value] if order[:order_fulfilled]
    order[:order_fulfilled] ? total + order[:order_value] : total
  end

  fulfilled_orders[index][:order_value] = order_value
end

p fulfilled_orders