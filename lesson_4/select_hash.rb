produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit_loop(produce)
  fruit = Hash.new(0)
  counter = 0
  produce_keys = produce.keys

  loop do
    break if counter == produce.size
    current_key = produce_keys[counter]
    current_val = produce[current_key]

    if current_val == 'Fruit'
      fruit[current_key] = current_val
    end
    count += 1
  end
  fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def select_fruit_method(produce)
  fruit = Hash.new(0)
  for key in produce.keys
    if produce[key] == 'Fruit'
      fruit[key] = 'Fruit'
    end
  end
  fruit
end