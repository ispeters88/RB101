# 7/6/22 #

def unique_in_order(iterable)
  iterable.is_a?(String) ? (iterable = iterable.chars) : iterable
  
  unique = []
  iterable.each do |element|
    unique << element if unique.last != element
  end
  unique
end

The definition of the `unique_in_order` method begins on `line 1` by conditionally transforming the value of the parameter `iterable`, depending on whether or not the object class is `String`. This is determined by calling the `#is_a?` method on the local variable `iterable` which was passed in as a parameter to the `unique_in_order` method. If `iterable` has the object class `String`, we reassign the value of `iterable` to a new `Array` object, created by invocation of the `String.chars` method on `iterable`. Otherwise, we do not change `iterable` to reference a different value.

On `line 4` we initialize local variable `unique` and point it to an empty `Array` object. Then we iterate over the sequence
pointed to by `iterable`, by calling the `Enumerable#each` method with `iterable` as a calling argument, with the parameter `element`. On each iteration, the code on `line 6` is processed, in which we conditionally add the current value of `element` to the `unique` array, by calling the `Array#<<` method with `unique` as calling argument and `element` as the calling parameter, but only if the final value of the `unique` array is not equal to the current value of `element`. This conditional check is done by calling the `Array#last` method on the `unique` array, and performing the `BasicObject#!=` method on the value returned by `unique.last` and `element1`.


```
def multiplication_table(size)
  result = Array.new

  (1..size).each do |row|
    (1..size).each do |col|
      result << row * col
    end
  end

  result.each_slice(size).map { |slice| Array.new(slice) }
end

puts multiplication_table(size)
```

The definition of the `multiplication_table` method begins on `line 1` by initializing a local variable `result` to a newly created `Array` object with no elements. The set of logic in `lines 4-8` performs a nested iteration by twice calling the `Enumerable#each` method on a `Range` object with start value 1 and end value equal to`size`, using a `do..end` block as an argument.

During the first call to `#each`, one parameter `row` is passed to the `do..end` block; during the second call, a parameter `col`
is passed. No action is taken within the outer iterative loop. Within the inner loop, the multiplicative product of the 
`row` and `col` local variables, that were passed in as parameters to the nested `Enumerable#each` method calls, is added to the `result` array that was initialized on `line 1`.

After the iterations are complete, subarrays of the `result` array are created with `size` elements on `line 10`, via a call to the `Enumerable#each_slice` method. This creates an `Enumerable` object, which is passed as the calling argument to the `#map` method, with the parameter `slice`. This method creates a new `Array` object where each element is the return value of the block sent as an argument to the method.

The practical result of this is to produce a 2-dimensional nested array with `size` elements, where each subarry contains `size`
elements. The values in this nested array are the product of the outer array and subarray index values.


```
def is_valid_walk(walk)
  return false if walk.size != 10

  directions = { 'n' => [1, 0], 's' => [-1, 0], 'e' => [0, 1], 'w' => [0, -1] }
  start_coords, coords = Array.new(2) { Array.new(2, 0) }

  walk.each do |direction|
    coords[0] += directions[direction][0]
    coords[1] += directions[direction][1]
  end

  start_coords == coords
end
```

# Line by line walkthrough only, with no broader conclusions on logical reasoning #

In this code snippet, a method `is_valid_walk` is defined which expects one parameter, `walk`, and returns a `boolean` value that indicates whether the calling argument is considered a valid "walk", per the problem statement. On `line 1`, the boolean value `false` is returned if the size of the `walk` parameter is anything other than 10. This conditional is achieved via the `BasicObject#!=` method, which is called on the return value of the `Array#size` method called on `walk`, and the `Integer` value `10`.

On `line 3`, a hash `directions` is initialized, with four key/value pairs. Each key is a one character `String` object, while each value is a two-item `Array` object where the elements are one of three possible `Integer` object values: -1, 0, or 1.

On `line 4`, two local variables are initialized, `start_coords` and `coords`. These are assigned to the values on the right hand side of the assignment operator (`is this OK?`), which are both Arrays containing two `Integer` objects, both `0`. This is achieved through the use of the `Array::new` method, which is called with size of 2, and a `{}` block as an argument. Within that block, the `Array::new` method is called again, with `size` 2, and this time with a default value of the `Integer` object `0`.

Next, starting on `line 6`, the `Array#each` method is called on the local variable `walk` which is a reference to the parameter passed in to the `is_valid_walk` method, with the parameter `direction`. On each iteration, the values within the `Array` object pointed to by the `coords` local variable are reassigned, via the `+=` shorthand for the `Integer#+` and `Array#[]` methods. On `line 7`, the first element in the `Array` object pointed to by the value of the `directions` hash at the key matching the `direction` local variable scoped to the `#each` iterable, is added to the first element in the `Array` object pointed to by the `coords` local variable, and that first element of the `Array` pointed to by the `coords` variable is reassigned to the resulting value. The same is done on `line 8` but for the second value of the `Array` object pointed to by the value of the `directions` hash at the key matching the `direction` local variable, along with the second value of the `Array` object pointed to by the `coords` local variable.

After the iteration is complete, on `line 11` a boolean value is returned from the method, by executing the `BasicObject#==` method on the local variables `start_coords` and `coords`


```
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

The final return value of this snippet of code is `["I like the letter 'a'", "I like the letter 'b'", "I like the letter 'c'"]`. The value of local variable `a` at the end of the code is the the `Array` object that was assigned to this variable on `line 5`:
`['a', 'b', 'c']`. When we invoke the `test` method, we pass a reference to this `Array` object pointed to by `a` outside of the method definition. We then call the `Array#map` method on this object, which returns a new `Array` object without mutating the calling argument.

```
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

The local variable `greeting` is assigned to a `String` object with value ``Hello'` on `line 1`. The `loop` method invocation is called with the `do..end` block as an argument on `lines 3-6`, and within this block the `greeting` variable is reassigned to a new `String` object, with value `'Hi'`. 

Because the `greeting` variable was initialized outside of the `loop` method invocation, it is accessible to the inner scope within the `do..end` block. As a result, by the time the `puts` method is called on `line 8`, the value that `greeting` is referencing is the `String` object `'Hi'`, and this is what is displayed. This example demonstrates local variable scoping rules in Ruby, and specifically that a variable initialized outside of a block is accessible within the inner scope of the block.


7/17/22

```
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')
```

The console output of this code snippet is `nil`, and the final return value on line `9` is the string `HHeelloo`. 

On lines `1-7` we define a method `repeater`, which takes a single parameter `string`, and then on line `9` we invoke that method, passing in the string object `Hello` as an argument. 

Within the `repeater` method, a local variable `result` is initialized to an empty `String` object. Then, we iterate over the characters in the string passed in as an argument to `repeater`. On each iteration, we add the current character to the string that `result` references two times.


```
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
```

In this code snippet, we initialize three local variables. The first, `x`, references a `String` object with the value `"hi there"`.

Then, on lines `2-3`, we initialize variables `my_hash` and `my_hash2` to `Hash` objects, both with a single key/value pair. In each case, the value is the string `"some value"`. 

The difference between the two is as follows: the `Hash` object referenced by `my_hash` uses a symbol object as its key: `:x`. This symbol has no relationship to the local variable `x`.

The `Hash` object that `my_hash2` references, on the other hand, uses the string object pointed to by the local variable `x`. 

```
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6
```

The return value of this code snippet is `nil`, and the result is that the value `6` is output to the console. 

On line `1`, we initialize a local variable `total` to the `Integer` object `0`. We then iterate over an `Array` object containing three elements, using the `each` method, passing in each element of the array to a `do..end` block.

Within the block on each iteration, the current value is added to the value of `total`, and then `total` is reassigned to the result of that addition. 

This snippet demonstrates variable scoping, as the `total` variable is accessible both outside and within the block on line `3` because it was initialized outside the block. If it had been initialized within the block, it would not have been available on line `5`. 


```
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

The return value of this code snippet is `nil`, and the result is that the string `Hi` is output to the console. 

This is because, while the `greeting` variable is initialized on line `1` to the `String` object `"Hello"`, it is reassigned to the `String` object `'Hi'` on line `4`. 

This reassignment is done within a `do..end` block passed as an argument to the `loop` method; the `greeting` variable is accessible within this block because it was initializedd outside the block. This demonstrates local variable scoping rules: variables initialized outside of a block are accessible within the inner scope of the block. Variables initialized within the inner scope of a block are not accesssible outside the block.


```
What does the code output and/or return? Why? and What concept does the example demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n| 
 n + 1
 end
p new_array
```

This code snippet returns and outputs the array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] to the console. 

Note that all the elements listed are the same as are defined in the `Array` object that is pointed to by the local variable `arr` which is initialized on line `1`. 

However, it is a separate `Array` object, which is referenced by a separate local variable, `new_array`. This variable is initialized on line `2` via method invocation of `Array#select`, which along with the `do..end` defines a block.

In this block, each value from `arr` is passed in; because the return value of the block evaluates as `true` in each instance, all of the elements are included in the resulting `Array` object that `new_array` points to.

This code demonstrates the "truthy" nature of all values other than `false` and `nil`. All other values evaluate as true and therefore are included in the array that results from the `select` method


Look at the following programs...

What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?


```
x = 0
3.times do
  x += 1
end
puts x
```

The value `3` is output to the screen. No error is returned. 

```
y = 0
3.times do
  y += 1
  x = y
end
puts x
```

An error is returned on line `6`, and nothing is output to the screen. This is because local variable `x` was initialized within the inner scope of the block defined by the `times` method invocation, along with the `do/end`, on lines `2-5`.



# Practice exercises from Google doc #
Located here: https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#heading=h.5lup6zlzr0iq

# Section 1 #


* Example 1 *

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

This code outputs the string "Goodbye" and then the string "Hello" to the console, and then returns `nil`. 

On line `1`, a local variable `a` is initialized to the `String` object "Hello". Then on line `2`, a second local variable, `b`, is initialized to the same `String` object.

On line `3`, local variable `a` is reassigned to a different string object, "Goodbye". This is then output to the console on line `4`.

On line `5`, the string object pointed to by local variable `b` is output to the console. This is still the string "Hello", because the reassignment on line `3` pointed `a` to a new string object, but did not affect `b`. 

This demonstrates the non-mutating nature of local variable reassignment via `=`. 


* Example 2 * 

What does the following code return? What does it output? Why? What concept does it demonstrate?
```
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```

This code outputs the value `5`, then returns a `NameError` exception.

Local variable `a` is initialized on line `1`. Then on lines `3-7`, the invocation of the `loop` method along with the `do..end` structure defines a block. Because `a` was initialized outside of this block, it is accessible to both the outer scope of the code snippet, as well as the inner scope of the block. On line `4`, the variable `a` is reassigned to the value `5`. This is subsequently what is output by the `puts` method on line `9`.

Local variable `b` is initialized on line `5`, within the block. Defining a block creates a new scope, and any local variables initialized within that block's inner scope will not be accesssible outside the block.

This explains the `NameError` exception that occurs on line `10`, as variable `b` is not accessible to the outer scope that this line resides in. This examples demonstrates local scoping rules in Ruby, particularly with method invocation with a block.

* Example 3 *
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

This code outputs the values `3` and then `2` (in that order), and returns `nil`. 

On lines `1` and `2`, local variable `a` is initialized to the value `4`, and variable `b` is initialized to the value `2`. 

The invocation of the `loop` method along with the `do..end` structure on lines `4-8` define a block. Within that block, a 3rd local variable `c` is initialized to 3, on line `5`. 

Then on line `6`, variable `a` is reassigned to the same `Integer` object with value `3` as variable `c`. 

This value `3` is output via the `puts` method on line `10`, and then the value `2` still pointed to by variable `b`, is output on line `11`, again by the `puts` method. The `puts` method always returns `nil`.

This code demonstrates local scoping rules in Ruby, and particularly that variables initialized outside of a block are available to the inner scope of the block. In this case, although variable `a` is reassigned to the value pointed to by the variable `c` - which is limited to the inner scope of the block since that is where it was initialized - it is still accessible outside the block, because it was first initialized outside the block.


* Example 4 * 

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

This code outputs the string 'hello' to the console three times, and returns `nil`. This is the result of the method invocation on line `10`. 

This method invocation calls the method `example` with argument 'hello'; this method is defined on lines `1-8`. 

The `example` method accepts a single parameter; when the calling argument 'hello' is passed into `example`, a local variable `str`, which is scoped within the method only, is initialized to this string 'hello'. Then on line `2`, a local variable `i` is initialied to the value `3`.

The method invocation of `loop` along with the `do..end` structure on lines `3-7` defines a block; the variables `str` and `i` are accessible within the inner scope created by this block definition, since they were initialized outside the block.

On each iteration of the block, the value referenced by `str`, which is the calling argument 'hello', is output to the console, and then the value of `i` is reduced by 1 via the reassignment on line `5`. This reassignment is done using an example of syntactical sugar in Ruby; `i -= 1` represents the same expression as `i = i - 1`.

Becuase `i` started at `3`, the loop iterates three times before the `break` statement is executed. The invocation of the `example` method then ends, with a final return value of `nil`, as this is always returned by the `puts` method.

This example demonstrates local scoping rules, as well as some Ruby syntactical sugar.


* Example 5 *
*5:46*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

This code outputs two strings: "Hello", and then "Goodbye", in that order. It then returns `nil`.

Lines `1-4` are a method definition for a method `greeting`. This method expects a single parameter, and outputs the value of that parameter, and then the string "Goodbye", both via the `puts` method. The `greeting` method returns `nil` because that is always the return value of the `puts` method.

On line `6`, a local variable `word` is initialized to the string "Hello". Then on line `6`, the `greetings` method is invoked with `word` as its argument. 

Within the `greeting` method, a local variable `str` is initialized, to the value pointed to by the `word` variable that was passed in as the method argument. So on line `2`, the string "Hello" is output, and on line `3`, the string "Goodbye" is output, and the method returns `nil` at the end of the code snippet.

This demonstrates the concepts of method definition and method invocation.


* Example 6 *
*5:34*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

This code outputs the value `Your total is 10`, and returns `nil`.

On line `1`, a local variable `arr` is initialized to an array object with four elements: `[1, 2, 3, 4]`

On lines `2-3`, local variables `counter` and `sum` are initialized, both to the value `0`.

Then on lines `5-9`, the invocation of the loop method along with the `do..end` structure defines a block. On each iteration of that block, the `sum` variable is reassigned to the previous value plus the value of the element in `arr` that is at the index position represented by the current value of `counter`. 

`counter` is incremented by `1`, and then the code checks if the current value of `counter` is equal to the size of `arr` (i.e. `4`). If it is, we exit the loop via the `break` statement.

Finally on line `11`, we print out a string indicating the total value pointed to by `sum`, via the `puts` method. This method always returns `nil`.

This code demonstrates scoping rules for local variables - particularly that variables initialized outside of a block are accessible within the block. It also uses Ruby syntactical sugar in the form of the `+=` method, which is reassignment. For example, `counter += 1` is the same as `counter = counter + 1`


* Example 7 *
*3:25*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

This code outputs the string 'Bill', and returns 'Bill'. 

On line `1`, local variable `a` is initialized to the string object `Bob`.

On lines `3-5`, the invocation of the `Integer#times` method along with the `do..end` structure defines a block. On each iteration, the local variable `x` is pointed to the current iteration value, but this variable/value is not used in the block.

Instead, on line `4`, the variable `a` is reassigned to a new string object with value 'Bill'. This happens 5 total times; each time the variable `a` is pointing to a new string object, but in each case the value is the same: 'Bill'. 

Finally on line `7`, the string object referenced by `a` is output to the console and returned, as a result of the `p` method. This is the string 'Bill'.

This code demonstrates scoping rules for local variables - particularly that variables initialized outside of a block are accessible within the block.


* Example 8 *
*5:14*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

This code outputs the string `'cat'` to the console via the `puts` method on line `10`, and then returns a `NameError` exception on line `11`, because the local variable `var` is only defined within the inner block scope of lines `3-7`.

The local variable `animal` is initialized to the string object `'dog'` on line `1`. Then, the invocation of the `loop` method along with the `do..end` structure on lines `3-7` defines a block.

This block iterates exactly once, due to the `break` statement on line `6`. During that single iteration, the `animal` variable is reassigned to the string object `"cat"` on line `4`; this is possible because variables initialized outside of a block are accessible within a block. Then on line `5` a new local variable `var` is initialized, to the string object `"ball"`. 

The `puts` method on line `10` causes the final value pointed to by `animal` to be output to the console: `"cat"`. 

Becuase the `var` method was initialized within the block on lines `3-7`, it is not accessible to the outer scope of this code snippet, and therefore throws a `NameError` exception.

This code demonstrates scoping rules for local variables - particularly that variables initialized outside of a block are accessible within the block.

# Section 2 #

* Example 1 *
*5:35*

What does the following code return? What does it output? Why? What concept does it demonstrate?

a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

This code outputs the following values, in order:
`5`
`5`
`4`
`2`

On lines `1-2`, two local variables are initialized: `a` is initialized to the value `4`, and `b` is initialized to the value `2`. 

The invocation of the `times` method, along with the `do..end` argument on lines `4-7`, define a block. In each iteration of the block, the current iteration value is passed to the local variable `a`. Since a variable with the same name was already initialized outside the block, the variable within the block points to a different location in memory. This is an example of the concept of variable shadowing. 

Within the block, the block variable `a` is reassigned to the value `5`, and then output to the console via the `puts` method. This iterative process occurs two times.

Then on line `9`, the value pointed to by the outer scoped variable `a` is output to the console. This is still the value `4`, because the variable shadowing on line `4` prevents this variable from being touched within the block. 

Finally on line `10`, the value pointed to by `b` - `2` - is output to the console, again via the `puts` method. The final return value of the code snippet is `nil`, as this is always the return value of the `puts` method.

This code demonstrates the concept of variable shadowing between outer scoped variables and block parameters.

* Example 2 *
*3:14*

What does the following code return? What does it output? Why? What concept does it demonstrate?
n = 10

1.times do |n|
  n = 11
end

puts n

This code outputs the value `10` and returns `nil`.

On line `1`, we initialize a local variable `n` to the value `10`. 

The `times` method along with the `do..end` argument on lines `3-5` define a block. Because the parameter passed in to the block, `n`, has the same name as the outer scope variable we initialized on line `1`, access to this outer scoped variable is prevented within the block.

The local variable `n` that is passed as a parameter to the `do..end` block is pointed to the value `11`, but this does not affect the outer scoped variable `n`, which remains pointing to the value `10`.

As a result, the `puts` method on line `7` outputs the value `10`. This example demonstrates variable shadowing between outer scoped variables and block parameters.

* Example 3 *
*3:51*

What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal

This code returns `nil` and outputs the string `"dog"` to the console.

On line `1`, the local variable `animal` is initialized, to the string object `"dog"`. 

The invocation of the `loop` method along with the `do..end` argument on lines `3-6` defines a block. We iterate over this method exactly once, due to the `break` statement on line `5`. 

Because the parameter passed in to the block, `animal`, has the same name as the outer scoped variable we initialized on line `1`, the block does not have access to that outer scoped variable. 

This is why the assignment on line `4` of `animal` to the string object `"cat"` does not affect the outer scoped variable `animal`, which remains pointing to the string `"dog"`. 

On line `9`, the `puts` method results in the string `"dog"` printing to the console, with a return value of `nil`. This example demonstrates variable shadowing between block parameters and variables initialized outside the block that have the same name.


# Section 3 #

* Example 1 *
*4:22*

What does the following code return? What does it output? Why? What concept does it demonstrate?
What are a and b?

```
a = "hi there"
b = a
a = "not here"
```

This code does not output anything. It returns the final value referenced by local variable `a`, which is "not here". 

The final value referenced by local variable `b` is "hi there".

On line `1`, local variable `a` is initialized to the string object "hi there". Then on line `2`, a 2nd local variable `b` is initialized to the same object. 

On line `3`, `a` is pointed towards a different string object, "not here", as a result of the reassignment performed on that line. This reassignment does not affect `b`, which remains pointing to the original string object "hi there"

This demonstrates the non mutating method of variable reassignment; the variable being reassigned is pointed towards a new object in memory, but this does not mutate the object the variable was previously pointing to.


* Example 2 *
*3:30*

What does the following code return? What does it output? Why? What concept does it demonstrate?
What are a and b?

```
a = "hi there"
b = a
a << ", Bob"
```

This code returns the final value of the object pointed to by local variable `a`, which is "hi there, Bob"; there is no output. The final value of the object pointed to by local variable `b` is the same, because `b` points to the same object as `a` as a result of the initialization of `b` to the object pointed to by `a`, on line `2`.

This object is initially the string "hi there" after the initialization of `a` on line `1`; however, it is mutated on line `3` by the mutating method `<<`, on line `3`. 

This example demonstrates the mutability of string objects, and an example of a mutating method, `<<`, which changes the value of the calling object.


* Example 3 *
*6:12*

What does the following code return? What does it output? Why? What concept does it demonstrate?
What are a, b, and c? What if the last line was `c = a.uniq!`?

```
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

This code returns the final value of the object pointed to by local variable `c`, which is an array containing 3 elements: [1, 2, 3]; there is no output. 

On line `1`, local variable `a` is initialized to an array object with 4 elements: [1, 2, 3, 4]. Then on line `2`, local variable `b` is initialized to this same array object. 

On line `3`, a 3rd local variable `c` is initialized to a new array object, which is created by invoking the `Array#uniq` method on the array object pointed to by `a`. The return value of this method invocation is an array object with any duplicate values from the calling object removed - in this case, the result is [1, 2, 3]. The new variable `c` points to this object, and its value is the final return value of the code.

After line `3`, local variables `a` and `b` both point to the same array object, [1, 2, 3, 3]. `c` points to a separate array object, [1, 2, 3].

If the last line was `c = a.uniq!`, then the return value would still be an array with values [1, 2, 3], but it would be the same object that `a` and then subsequently `b` were initialized to. This is because the `Array#uniq!` method mutates and then returns the original object, as opposed to `Array#uniq` which just creates a new array and returns that.

This demonstrates the differing results from using mutating and non-mutating methods in ruby.


* Example 4 *
*6:50*

What does the following code return? What does it output? Why? What concept does it demonstrate?

What is `a`? What if we called `map!` instead of `map`?

```
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

The return value of this code snippet is the return value of the invocation of the `test` method with argument `a`; there is no output.

The definition of this method is found in lines `1-3`. The method parameter `b` calls the `Enumerable#map`, along with a `{}` block statement. 

Within the block, the block variable `letter` is assigned to each element of the calling enumerable object in turn. The `map` method creates a new enumerable object containing each iteration's return value.

On line `5`, we initialize an array object containing 3 elements : `['a', 'b', 'c']`. On line `6`, we pass this array in as the argument for the `test` method, and the return value is a separate array with 3 elements:
`["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

At this point, the object pointed to by `a` remains the same as on line `5` - `['a', 'b', 'c']`

If we had called `map!` instead of `map`, then the return value would be the same, but the value of `a` would be the same as the return value, because the `map!` method mutates the calling array.

This demonstrates the difference between mutating and non-mutating methods.


* Example 6 *
*7:50*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

This code returns `nil` and outputs the string 'Written Assessment'.

Lines `1-4` are `method definition` for a method called `test` that accepts one parameter, which is assigned to a local variable scoped to the method, `str`. 

On line `2`, `str` is reassigned via the `!=` method, which is Ruby syntactical sugar for `str = str + '!'`. 

Then on line `3`, the value of the object `str` is pointing to is mutated by the `downcase!` method, which results in all characters within the string being set to lowercase.

On line `6`, a local variable `test_str` is initialized, to the string object `'Written Assessment'`. Then on line, `7`, we call the `test` method, passing `test_str` as the argument. 

The method returns the `str` variable, which points to a new string object, with value `'written assessment'`. 

However, `test_str` remains unchanged, since the method variable `str` was reassigned to a new object. 

This demonstrates the non-mutating nature of reassignment, which if done within a method, will prevent any mutation further down in the method, from occurring to the original argument passed in to the method. 


* Example 7 *
*5:41*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

This code outputs the value 3, then the value 5, in that order; the return value is `nil`.

On line `5`, local variable `a` is initialized to the Integer object `3`. Then on line `6`, local variable `b` is initialized to the return value of the method `plus`, called with the arguments `3` (pointed to by variable `a`) and `2`. This method is defined on lines `1-3`. 

The `plus` method accepts two parameters, which are initialized to the variables `x` and `y` scoped to the method. In this case, `x` is initialized to the Integer object `3`, and `y` is initialized to the Integer object `2`.

On line `2`, the method variable `x` is reassigned to the sum of `x` and `y`, which is the Integer object `5`. Therefore, `b` is initialized to the Integer object `5` (line `6`)

On line `8`, the value pointed to by `a`, `3`, is output via the invocation of the `puts` method. Then on line `9`, the value `5` which is pointed to by `b` is output; the return value of the `puts` method on line `9` is `nil`.

This demonstrates the immutability of integers, as well as the non-mutating nature of reassignment.



* Example 8 *
*6:12*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

This code returns `nil`, and outputs the string 'ab'. 

Lines `1-3` are `method definition` for a method called `increment`. This method accepts one parameter, `x`.

On line `2`, the mutating method `<<` is used to add the string `'c'` to the end of the object pointed to by the method's local variable `x`.

Starting on line `5`, we prepare to call the `increment` method, by first initializing a local variable `y`, to the string object `'a'`. We then call `increment` with `y` as argument on line `6`.

Because the single line of code within the `incremenet` method is mutating with respect to the calling argument, the value of the object that `y` is pointing to changes to `ab`. This is what is output on line `8` by the `puts` method, which always returns a `nil` value.

This demonstrates a mutating method, and how calling such a method with a mutable object will cause the object's value to be changed. 

* Example 9 * 
*5:01*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name 
```

This code returns `nil`, and outputs the value `'jim'`. 

This is the value of the object that the local variable `name` is initialized to, on line `5`. We subsequently output that value to the console with the `puts` method, on line `7`; the return value of `puts` is `nil`.

In between the initialization of the `name` variable and the invocation of the `puts` method (with `name` as argument), we invoke another method, `change_name`, with argument `name`.

The method definition for `change_name` is found on lines `1-3`. On line `1`, we initialize a local variable scoped to the method, to the value of the passed in argument - in this case, `'jim'`.

On line `2`, we use reassignment to point this local variable `name` to a different string object, with value `'bob'`. However, this is non-mutating with respect to the object that the outer scoped variable `name` pointed to, and therefore no changes are made to that object. 

This demonstrates the non-mutating nature of reassignment, and the differences between variables scoped to methods and those scoped outside of methods, particularly when using non-mutating methods.

* Example 10 *
*5:28*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
``` 

This code returns `nil`, and outputs `"JIM"`. 

On line `5`, we initialize a local variable `name` to a string object with value `'jim'`. We then invoke a method `cap` on line `6`, passing `name` as the argument, and finally on line `7` we invoke the `puts` method with `name`. 

The return value of the `puts` method is always `nil`. The output in this case is related to the invocation of the `cap` method. This method is defined on lines `1-3`, and is mutating with respect to its calling argument, as a result of the `String#capitalize!` method on line `2`. 

The `capitalize` method is called on the object that the method variable `str` is initialized to, which is the same as the calling argument - in this case, the string `'jim'`. This object's value is changed to `'JIM'`, such that the `name` variable outside the method points to the string `'JIM'`. This value is output by the `puts` msthod

This demonstrates a mutating method being called on a mutable object, and the results of doing so on a variable from outside a method that was passed in as an argument to the method - in particular, the fact that this will mutate the object the outer scoped variable points to.

* Example 11 *
*10:42*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end


puts arr1 
puts arr2
```

This code returns `nil`, and outputs two array objects as follows:
  `["a", "b", "c"]`
  `["A", "B", "C"]`

These outputs are the result of the invocation of the `puts` method on lines `7-8`, and the return value is the result of the `puts` method on the final line; `puts` always returns `nil`.  

On line `1`, we initialize a local variable `arr1` to an array object with 3 elements: `["a", "b", "c"]`. Then on line `2`, we initialize a second local variable `arr2`, to a separate array object whose elements are the same objects as the corresponding elements from `arr1`. 

On lines `3-5`, the invocation of the `Array#map!` method along with the `do..end` define a block, where the block variable `char` is iteratively initialized to each element in the calling array `arr2`. 

The return value of each iteration from the `map!` method is the uppercased version of the original value. Becuase `map!` is a mutating method with respect to the calling array, `arr2` is mutated. 

However, `map!` is not necessarily mutating with respect to the elements in the calling array; this depends on the code executed within the block. In this case, the block uses the non-mutating method `String#upcase` on line `4`, so while the elements defined within `arr2` are transformed, the objects that were originally in the array are not modified. 

This is why, when we print out the contents of `arr1`, which contains those original elements, they are unchanged. If line `4` had used the mutating method `upcase!`, then `arr1` would also print out as `["A", "B", "C"]`

This demonstrates the differences between mutating and non-mutating methods, as well as the fact that it is possible to mutate an array object by assigning different elements into the same array, without mutating those elements; it can also be possible to keep the same objects as the array elements, and mutate those -- but that is not what occurs here.


##
Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

The last line of this code outputs the string value `'Hi'` because this is the value of the object that the local variable `greeting` points to at that point.

This variable `greeting` is initialized to a string object with value `'Hello'` on line `1`, but then within the block defined by the invocation of the `loop` method along with the `do..end` structure from lines `3-6`, `greeting` is reassigned to a different string object, with value `'Hi'`. 

The variable `greeting` is available for reassingment on line `4` within the block as a result of local scoping rules in Ruby: variables initialized outside a block are accessible within the block. The reverse is not true; variables initialized within a block are not accessible outside the block.

In addition to the nature of local variable scoping rules, this code also demonstrates the non-mutating nature of variable reassignment; when reassigning a variable with the `=` operator, the original object that the variable was pointing to is not mutated. Instead, the variable is pointed towards an entirely different object.

# Section 4 #

* Example 1 *
*7:48*

What does the following code return? What does it output? Why? What concept does it demonstrate? 

What values do `s` and `t` have? Why?

```
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

On line `7`, we initialize a local variable `s` to a string object `'hello'`. On line `8`, we initialize a second local variable, the return value of the invocation of a call to method `fix`, passing `s` as the argument.

This `fix` method is defined on lines `1-5`. On line `1`, the calling argument is assigned to a local variable named `value`, within the scope created by the method definition.

We then mutate the object that `value` points to on line `2`, via the `String#upcase!` method. This is the same object that `s` points to, so at this point, both `value` within the method definition, and `s` in the outer scope, point to a string object with value `'HELLO'`. 

On line `3`, we again mutate the object that `value` and `s` point to, via the `String#concat` method. After this line, both variables point to a string object with value `'HELLO!'`. Then on line `4`, we simply return the value of this string object back to line `8`. 

This code returns the string value `'HELLO!'`; it does not output anything. This demonstrates the mutability of strings and the effects of objection mutation within methods. 

`t` and `s` both point to the same string object, with value `'HELLO!'`


* Example 2 *
*4:34*

What does the following code return? What does it output? Why? What concept does it demonstrate?
What values do `s` and `t` have? Why?

```
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

This code returns the string value `'HELLO'`; there is no output.

Similarly to the previous example, we call method `fix` on line `7`, passing local variable `s` in as the argument. `s` was initialized to a stirng object with value `'hello'` on line `6`. 

The difference this time is that on line `2`, we change the object that the method-scoped variable `value` is pointing to. As a result, the mutating method `concat` does not mutate the object that `s` points to (although it does still mutate the object that the method variable `value` is pointing to)

The final consequence of this is that the object `s` references still has the value `'hello'` at the end of the code snippet; `t` references a different string object with the value `'HELLO!'`

This demonstrates the non-mutating nature of reassignment of local variables, and more specifically the fact that, when reassignment is done to a method variable initialized to the calling argument, there is no longer any ability to further mutate 
the original calling argument, since that method variable is now pointing to a different object.


* Example 3 *
*3:05*

What does the following code return? What does it output? Why? What concept does it demonstrate?
What values do `s` and `t` have? Why?

```
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

The explanation is very similar to those of the previous two exercises. In this case, the first line (line `2`) within the method definition for `fix` is an invocation of a mutating method, so the object the outer scoped variable `s` is pointing to does get mutated. 

The end result is that `s` points to a string object with value ''helloxyz'', and `t` points to a separate string object, with value `'HELLOXYZ!'`. 

The return value is the value of the string object `t` points to, `'HELLOXYZ!'`

This again demonstrates the ability to mutate the calling argument within a method, as well as the non-mutating nature of variable reassignment.


* Example 4 *
*6:13*
What does the following code return? What does it output? Why? What concept does it demonstrate?
What values do `s` and `t` have? Why?

```
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

This code returns the value `'HELLO!'`; there is no output. 

The return value is the value of the object that local variable `t` points to, which is initialized on line `7` to the return value of the method invocation of method `fix` with calling argument `s`. 

The local variable `s` is initialized on line `6` to a string object with value `'hello'`. 

Within the method definition of `fix` on lines `1-4`, the object that the calling argument `s` points to is assigned to the parameter `value` which initializes a local variable defined for the scope created by the method definition.

On line `2`, reassignment is used on the variable `value`, which typically results in a variable being pointed to a different object, but in this case it is simply repointed to a mutated version of itself. Therefore, after line `2` is executed, the method scoped variable `value` is still pointing to the same object as the outer scoped variable `s`, which has now been mutated such that its value is now `'HELLO'`

On line `3`, we further mutate this object, so now the object referenced by both method-scoped `value` and outer-scoped `s` has value `'HELLO!'`.

This is the value that is returned at the end of this code snippet, and is the value of the object that both `s` and `t` reference.

* Example 5 *
*6:11*

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```

This code returns the string 'axc'; there is no output.

Lines `1-4` contain a method definition, for a method named `fix` that takes one parameter, `value`. 

On line `6`, we initialize a local variable `s`, to a string object with value `'abc'`. On line `7`, we pass this object in as the calling argument for method `fix`, and initialize local variable `t` to the return value of this method invocation.

When the method `fix` is invoked with calling argument `s`, a local variable `value` is initialized within the inner scope created by the method definition for `fix`.

On line `2` within the method, the second character of the string object pointed to by `value` is mutated to the value `'x'`. Since this is the same object that outer scoped variable `s` points to, after this line both `s` and the inner scoped `value` reference an object with value `axc`. 

This value is returned from the method on line `3` and assigned to the outer scoped variable `t`.

This demonstrates the mutating nature of indexed assignment, and more generally the ability to mutate calling arguments.

* Example 6 *
*5:00* 

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```
This code returns and outputs the same value, string `'hello world'`. 

On line `5`, local variable `a` is initialized to a string object with value `'hello'`. Then on line `6`, method `a_method` is called, passing `a` as the argument.

The method definition for `a_method` is found on lines `1-3`. On line `1`, a local variable `string` is initialized within the inner scope created by the method definition, to the calling argument. In this case, the calling argument is a variable that points to a string object; method variable `string` is initialized to this string object, with value `'hello'`. 

Then on line `2`, the mutating method `String#<<` is invoked on this object, such that its value becomes `'hello world'`.

Finally, on line `7`, the `p` method is used to output and return the final value of the object that `a` points to, which is `'hello world'`

This demonstrates the ability to mutate a calling argument within a method, and the mutating nature of the `<<` method in particular.


* Example 7 *
*2:35*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
num = 3

num = 2 * num
```

This code returns the value `6`; there is no output. 

On line `1`, local variable `num` is initialized, to the `Integer` object `3`. 

Then on line `3`, `num` is reassigned to another `Integer` object, the result of the expression `2 * num`. This expression is evaluated before the reassignment is executed, so the result of the expression is `6`.

This demonstrates the non-mutating nature of variable reassignment, which is somewhat irrelevant for this example in any case, since the object class used within this code snippet, `Integer`, is by definition immutable.

* Example 8 *
*3:16*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = %w(a b c)
a[1] = '-'
p a
```

This code outputs and returns an array with three elements: `["a", "-", "c"]`

On line `1`, local variable `a` is initialized to a 3-element array with values : `["a", "b", "c"]`

On line `2`, the element at index `1` within `a` is reassigned to the value `'-'`. This changes the object defined at this position in the array and is therefore non-mutating with respect to that element, but it is mutating with respect to the array as a whole. After this line is executed, `a` is pointing to the same `Array` object, but that object now has the elements `["a","-", "c"]`

Finally on line `3`, the `p` method is invoked with variable `a` as its calling argument. 

This demonstrates the mutating nature of indexed reassignment

* Example 9 *
*9:30*

```
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

This code outputs an array object with two elements: `['bob', 'kim']` ; the return value is `nil`.

On line `5`, a local variable `names` is initialized to an `Array` object with two elements: `['bob', 'kim']`

Then on line `6`, the method `add_name` is invoked with two arguments: the variable `names`, and a string object with value `'jim'`.

The method definition for `add_name` is found on lines `1-3`. Within the method, two local variables are initialized within the inner scope created by the method definition: `arr` and `name`. As a result of the calling arguments in this example, the object `arr` points to is the same `Array` object that outer scoped variable `names` points to. The object `name` points to is the string object with value `'jim'` that was passed in as the second argument in the method invocation from line `5`.

On line `2`, the variable `arr` is reassigned to a new array, as a result of calling the non-mutating method `+` on `arr` and the object pointed to by `name`.  This value is then returned; however, at this point, the outer scoped variable `names` has not been mutated, we have just returned a new `Array` object.

Thus, on line `7` when we invoke the `puts` method on the variable `names`, we are outputting the original value of the object this variable points to: `['bob', 'kim']`. The return value of `puts` is always `nil`.

This demonstrates the non-mutating nature of reassignment and of the `Array#+` method, particularly in regards to the interaction between an outer scoped variable passed in as an argument to a method invocation, and the inner scope created by the method definition.



* Example 10 * 
*2:52*

```
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

This is very similar to the previous example, with the exception that the method called on line `2` within the method definition is mutating with respect to the argument. 

This means that the object referenced by the `names` argument passed in to the `add_name` method is mutated; after line `6` is executed, the value of the object referenced by `names` is `['bob', 'kim', 'jim']`.

This array value is what is output by the invocation of the `puts` method on line `7`; the return value is `nil`, as always for the `puts` method.

# Section 5 #

* Example 1 *
*5:39*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```

This code outputs the values `1`, `3`, and `5`, and then returns an empty array.

On line `1`, we initialize a local variable `array` to an `Array` object containing 5 elements: `[1, 2, 3, 4, 5]`

The invocation of the `Array#select` method along with the `do/end` structure defines a block, within which each element from the caller `array` is assigned to the block variable `num`. 

The `select` method returns a new array containing all elements from the original array, for which the block returns a value that evaluates as `true`. 

The expression on line `4` within the block returns `nil` for all of the array elements, which evaluates as `false`, so none of the original array elements are selected, and we return an empty array. 

There is a side effect during the execution of the block through the `select` method; for each element that has an odd integer value, we output that value to the console.

This demonstrates the function of the `select` method, specifically the way it creates a new array that keeps any elements for which the block's return value evaluates as `true`, and discards those for which the block's return value evaluates as `false`.


* Example 2 *

What does the following code return? What does it output? Why? What concept does it demonstrate?
*4:06*

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

This code returns an array containing 5 elements: `[1, 3, 5, 7, 9]`; there is no output.

On line `1` we initialize a local variable `arr` to an `Array` object containing 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

Then on line `3` we invoke the `Array#select` method with `{}` to define a block. This method returns a new array, where the block's return value on each iteration determines if the element from `arr` is included in the new array.

The resulting array contains all the elements from `arr` that have odd integer values, as the block's return value is `true` for these values. 

This demonstrates the function of the `select` method, specifically that it will include elements from the calling array into the new array that is returned, if the block passed in to `select` returns `true` or returns a value that evaluates to `true`.

* Example 3 *
What does the following code return? What does it output? Why? What concept does it demonstrate?
*4:59*

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end

p new_array
```

This code outputs and returns an array with 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

This is due to the way the `Array#select` method functions. We start by initializing a local variable `arr` to an `Array` object with 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then on line `3`, we initialize a second variable, `new_array`, to the return value of invoking the `select` method on `arr`.

This `select` method is called with a `do/end` which defines a block; the method iterates over the calling array object, passing each element to the block. `select` returns a new array containing each element from the calling array, for which the block returns `true` or a value that evaluates as `true`. 

In this case, there is one line of code executed in each iteration through the block, on line `4`. The expression on this line, `n + 1`, returns an integer value for each element from the calling array `arr`. These integer values all evaluate as `true`, therefore the returned value contains all the elements that were found in the original array `arr`.

This demonstrates the function of the `select` method, and the relationship between boolean values and all other values in Ruby: all values except for `false` and `nil` evaluate as `true`.


* Example 4 *
*4:30*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```

This code outputs and returns an `Array` object with no elements (empty array)

On line `1`, we initialize a local variable `arr` to an `Array` object with 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

Then on line `3`, we initialize a second variable, `new_array`, to a separate `Array` object that results from the invocation of the `select` method on `arr`. This method invocation, along with the `do/end` structure on lines `3-6`, defines a block.

The `select` method iterates over the elements in the calling array `arr`, passing each element into the block. The return value of the block for each element determines if that element is added to the new array that is returned by `select`: if the return value evaluates as `true`, it is included in the returned array; otherwise, it is not included.

The final return value of the block for each iteration is determined by the return value of the last line of the block - line `5` of this code snippet. The invocation of the `puts` array on this line returns a value of `nil` in each case, which evaluates as `false`. As a result, none of the elements from the original array `arr` which called `select`, are included in the new array that is returned by this method.

This demonstrates the function of the `select` method, as well as the nature of boolean values in Ruby and the way that `nil` evvaluates as `false`.


* Example 5 *
*5:03*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

This code outputs and returns an array containing five elements: `[false, true, false, false, true]`

On line `1`, we initialize a local variable `words`, to an `Array` object containing five values: `['jump', 'trip', 'laugh', 'run', 'walk']`

Then on line `3`, we initialize a second local variable `new_array`, to the return value of invoking the `Array#map` method on `words`. This method invocation along with the `do/end` structure on lines `3-5` define a block; the `map` method iterates over the elements of the calling array and passes each element into the block.

`map` returns a new array (distinct object from the calling array), and performs a transformation function on the elements from the calling array to determine the elements within this new array. The return value of the block on each iteration is the value added to the new array returned by `map`.

The single expression in the block on line `4` returns a boolean value in each case - either `true`, or `false`, depending on whether the element from the calling array `words` starts with the character `t` or not. Therefore, the array returned by `map`, which is assigned to the local variable `new_array`, contains 5 elements that are either `true` or `false`.

This demonstrates the function of the collection iterator method `map`, which iterates over elements in a collection and transforms them to the return value of a block.


* Example 6 *
*3:13*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

On line `1`, we initialize a local variable `arr` to an `Array` object with 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

This code outputs each of the elements in `arr`, in order:


`1`
`2`
`3`
`4`
`5`
`6`
`7`
`8`
`9`
`10`

It then returns the original value of the array pointed to by `arr`: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

This is the result of the invocation of the `each` method on the array pointed to by `arr`. This method along with the `{}` structure defines a block. The method iterates over all the elements in the calling array `arr`, and executes any code found in that block; after the iteration is complete, `each` returns the original array.

This demonstrates the function and return value of the `each` method. 

* Example 7 *
*3:49*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
```

This code outputs and returns an array with 10 elements: `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`

This demonstrates the function of the `Array#map` method, in particular the way it iterates over the elements in a collection and transforms them based on the return value of a block that is passed to the method.

On line `1`, we initialize a local variable `arr`, to an array with 10 elements: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

On line `3`, we initialize a second variable `incremented`, to the return value of invoking the `map` method on `arr`. This method iterates over the elements in the calling array `arr`, passing each element to the block.

The final return value of the `map` method is a new array object where each element is the return value of the block for each iteration. The expression on line `4` returns the current element from the calling array `arr` increased by 1.



* Example 8 *
*4:34* 

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

This code outputs and returnsreturns an array containing ten elements: 

`[false, true, true, true, true, true, true, true, true, true]`

On line `1`, we initialize a local variable `arr` to an `Array` object containing ten elements: 
`[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Then on line 3, we initialize a second local variable, `new_array`, to the return value of the invocation of the `Array#map` method on `arr`, passing in a block with argument `n`. 

The `map` method iterates over the calling array `arr`, passing each element in to the block in succession. Its final return value is a new array with the same number of elements as the calling array, where each element is the return value of the block on each iteration.

The one expression within the block in this case, found on line `4`, returns a boolean value based on whether the element for the current iteration is strictly greater than `1`. This is true for all but the first element in the calling array `arr`, so the first element of the array returned from `map` is `false`, and the rest of the elements are `true`.

This demonstrates the use of collection iterators with a block, and in particular the `map` method which performs transformation on the calling collection (in this case, an array)


* Example 9 *
*5:23*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
```

This code first outputs each of the values 1-10 in succession.

Then, the code outputs and returns an array containing 10 elements, all of them the value `nil`:
`[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`

On line `1`, we initialize a local variable `arr` to an `Array` object containing 10 elements: 
`[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

We then initialize a second local variable `new_array` on line `3`, to the return value of the invocation of the `Array#map` method on `arr`. This method iterates over the elements in `arr`, and uses a block to transform those elements; its final return value is a new array containing the return value of the block from each iteration.

In this case, there are two expressions within the block; the first is irrelevant in terms of the array returned by `map`. The second line, `puts n`, outputs to the console the value of `arr` for the current iteration, but the important point for the purposes of the new array created by the `map` method is the return value, which for `puts` is always `nil`. Therefore, `new_array` will be an `Array` object containing ten instances of the value `nil`.

This demonstrates the function of the `map` method to return a new array where each element is the return value of the block for the corresponding element in the calling array.


* Example 10 *
*5:24*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = "hello"

[1, 2, 3].map { |num| a }
```

This code returns an array containing three elements: `["hello", "hello", "hello"]`. It does not output any values.

On line `1`, we initialize a local variable `a` to a string object with value `"hello"`. Then on line `3`, we invoke the `Array#map` method on the array `[1, 2, 3]`, passing in a `{}` structure that together with the method invocation of `map`, defines a block. 

The `map` method iterates over the values in the calling array, passing each one into the block, and assigning each in turn to the block parameter, which in this case is `n`. 

However, in this code, the block parameter is not used, and instead the block's return value on each iteration is simply the object pointed to by the local variable `a`, which is accessible within the block due to Ruby's local variable scoping rules, since `a` was initialized outside the block.

The `map` method's return value is a new array where each element is the return value of the block for each iteration through the calling array - this is true even if the elements in the original array are completely disregarded, as is the case here.

The return value of the block on each iteration is the same in this example - the value `"hello"`. Therefore, the return value of the invocation of `map` is the array `["hello", "hello", "hello"]`

This demonstrates the function of the `map` method, particularly the way the array returned by this method contains the return value of each iteration of the block passed in to `map` - even if this return value doesn't consider the element from the original calling array.

* Example 11 *
*3:38*

What does the following code return? What does it output? Why? What concept does it demonstrate?

```
[1, 2, 3].each do |num|
  puts num
end
```

This code outputs the values `1`, `2`, and `3` in succession, and then outputs the array `[1, 2, 3]`

On line `1`, we call the `each` method on an array `[1, 2, 3]`; this method invocation along with the `do/end` structure defines a block.

The `each` method iterates over the elements in the calling array, passing each into the block, which assigns each in turn to the block parameter, which in this case is `num`. 

`each` then executes any code expressions found within the block, and its final return value is the original calling array. 

The expression found within the block in this case, on line `2`, outputs the current iteration value to the console. This gives us:

`1`
`2`
`3`

And finally `each` simply returns the original calling array, `[1, 2, 3]`.

This demonstrates the function of the collection iterator method `each`, in particular the way it executes code within the passed in block on each iteration, but does not consider the return value of the block, as its final return value is simply the calling array.



# Section 6  - collections and methods #


* Example 1 *
*4:30*
```
[1, 2, 3].any? do |num|
  num > 2
end
```

This code returns the value `true`; there is no output.

On lines `1-3`, we invoke the `Array#any?` method on the array `[1, 2, 3]`; the method invocation along with the `do/end` structure defines a block, with local block parameter `num`. 

The `any?` returns either:
   `true`, if the block returns a value that evaluates to `true` for at least one of the elements in the calling array, OR
   `false`, if the block does not return a value that evaluates to `true` for any of the elements in the calling array

The expression within the block returns true if the current iteration value is strictly greater than 2, and false otherwise.

The block returns `false` for the first two elements in the calling array in this case, but does return `true` for the 3rd element, `3`.

This demonstrates the function of the `any?` method, particularly how it can be combined with a block. 

* Example 2 *
*6:31*

```
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

This code returns the value `true`; there is no output.

On line `1`, we invoke the method `any?` on a hash containing three key/value pairs. Together with the `do/end` structure on lines `1-3`, this method invocation defines a block.

The `any?` method iterates over the calling collection (in this case, a hash), passing each element into the block, and assigning it to the block argument. In this case, upon each iteration the key and the value from the hash are passed in to the block and assigned to the local variables `key` and `value` (respectively), which are limited to the inner scope created by the block.

The block is evaluated for each key/value pair of the calling hash, and if its return value evaluates to `true` for at least one iteration, `any?` will return `true`; otherwise, it will return `false`.

There is a single expression in the block, `value.size > 4`. This expression returns `true` for the second key/value pair in the calling hash, `:b => "bear"`. At this point, the iteration is halted and the `any?` method returns `true` - this is due to the `short-circuit logic` of this method: there is no need to check any additional elements within the calling collection, since `any?` will return `true` regardless of the results of the rest of the possible iterations.

This demonstrates the function of the `any?` method, and in particular its short circuit logic when an iteration prior to the last iteration returns a `true` value from the block evaluation.

* Example 3 *
*5:36*
```
[1, 2, 3].all? do |num|
   num > 2
end
```

This code returns `false`; there is no output.

On line `1`, we call the `all?` method on the array `[1, 2, 3]`; together with the `do/end` structure on lines `1-3`, this defines a block.

The `all?` method iterates over the elements in the calling array, passing each into the block and assigning them in turn to the local variable `num` which is limited to the scope created by the block.

Within the block, the current element, which is pointed to by the local variable `num`, is compared to the integer `2`; if `num` is strictly greater than `2`, the block returns `true`. Otherwise, it returns `false`.

The `all?` method returns `true` if and only if the return value of the block for every iteration evaluates to `true`; otherwise, `all?` returns `false`.

In this example, the block returns `false` on the first iteration, for the element `1` (`1 > 2` -> `false`). At this point, iteration stops and the method immediately returns `false`, due to the `short-circuit logic` of `all?`

This demonstrates the function of the `all?` method, which acts as a group `AND` expression for all the return values of the block on each iteration through the calling collection. It also demonstrates the way this method is passed a block and the short-circuit logic of the method.

* Example 4 *
*4:35*

```
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

This code returns `true`; there is no output.

The method `all?` is called on a hash with three key/value pairs. This method invocation along with the `do/end` structure on lines `1-3` defines a block. `all?` passes each key/value pair of the calling hash into the block, where they are assigned to local variables `key` and `value` (respectively) which are initialized within the scope created by the block. 

The `all?` method returns `true` if every iteration through the block returns a value that evaluates to `true`; otherwise, `all?` returns `false`. 

In this case, the block is checking the length of the value from each key/value pair, and returning `true` if that length is greater than or equal to `3`, and otherwise returning `false`.

This block expression returns `true` for all three key/value pairs in the calling hash, therefore `all?` returns `true` in this example.

This demonstrates the function of the `all?` method, which acts as a group `AND` expression for all the return values of the block for each iteration through the calling collection. 


* Example 5 *
*5:48*

```
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

This code outputs three lines of text, as follows:
"The index of 1 is 0"
"The index of 2 is 1"
The index of 3 is 2"

It then returns the array `[1, 2, 3]`

On lines `1`, we invoke the `Enumerable#each_with_index` method on an array, `[1, 2, 3]`; this method invocation along with the `do\end` structure on lines `1-3` defines a block. 

The `each_with_index` method iterates over the elements in the calling array, passing each one in to the block, along with the index position for each element. These are assigned to the local variables `num` and `index` (respectively) which are initialized within the inner scope created by the block.

On each iteration, any expressions defined within the block are executed. In this case, there is one expression, on line `2`: invocation of the `puts` method, which outputs a string containing the current value of `num` and `index`. 

The return value of the `each_with_index` method is the original calling array, `[1, 2, 3]`

This demonstrates the function of the `each_with_index` method - how it executes the block expression(s), and returns the calling array.

* Example 6 *
*6:50*

```
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

This code returns an array with three elements: `["ant", "bear", "cat"]`

On line `1` we invoke the `Enumerable#each_with_object` method on a hash with three key/value pairs; this method invocation along with the `do\end` structure defines a block.

The `each_with_object` method takes an argument for an object type to pass into the block as it iterates through the calling collection. On each iteration, the element from the collection along with the object argument given to `each_with_index` are passed to the block and assigned to the local variables declared for the block's scope. 

In this case, since the calling collection is a hash, the element in each iteration is a key/value pair (in the form of a two-item array); this is assigned to the local variable `pair`, while the `Array` object that was passed as argument to `each_with_object` is assigned to the local variable `array`. 

On line `2`, we add the second element in `pair`, which is the value from the key/value pair of the calling hash, to `array`, using the mutating method `<<`. The second element is extracted with the method `Array#last`, which returns the final element of the calling array.

The end result of this iteration is that the value from each key/value pair of hte calling hash are added to the `Array` object that was created by the invocation of `each_with_object` with the argument `[]`

The return value of `each_with_object` is this array, which contains the three values from the calling hash. This demonstrates the function of the `each_with_object` method, in particular how the collection elements are passed into the block when the calling collection is a hash.

* Example 7 *
*6:30*
```
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

This code returns a hash object with three key/value pairs, as follows `{"ant" => :a, "bear" => :b, "cat" => :c}` ; it outputs nothing.

On line `1` we invoke the method `Enumerable#each_with_object` on a hash, with an empty hash object `{}` as the argument. This method iterates over the calling hash and updates the passed in object (hash in this case), based on any expressions executed in the block. 

On line `2` we add a key/value pair to the method argument hash - specifically, reversing the key and value from the calling hash, such that the key of the calling hash becomes the value of the argument hash, and the value of the calling hash becomes the key of the argument hash.

The final return value of the `each_with_object` method is the object passed in as argument, with all the updates applied through each iteration included.

This demonstrates the function of the `each_with_object` method, along with syntactic sugar in the form of the 
`|(key, value), hash|` declaration of the block variables.

* Example 8 *
*10:06*
```
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

This code outputs two arrays in succession:
`[1, 3]`
`[2]`

It then returns the array `[2]`

On line `1`, we initialize two local variables, `odd` and `even`, via inline multiple assignment. This syntactic sugar allows us to initialize multiple variables to separate values based on the values found in an array.

We generate the array we use for this purpose by invoking the `Enumerable#partition` method on an array with three elements,    `[1, 2, 3]`. This method iterates over the calling collection and splits it into two new arrays based on the return value of the block we supply to it. These two new arrays will be returned as a 2d nested array: the first subarray will contain the values from the calling collection for which the block evaluate as `true`, while the second will contain the values for which the block evaluates as `false`.

On each iteration, we pass a value from the calling array and assign it to local block variables `num`; we then invoke the `Integer#odd?` method on `num`. This method returns `true` for the elements `1` and `3` from the calling array, so those two values are added to the first subarray of the return value for `partition`. `odd?` returns `false` for the element `2`, so that value is added to the second subarray.

So, the return value is `[[1, 3], [2]]`. Our inline multiple assignment dictates the the local variable `odd` be initialized to the array `[1, 3]`, and the local variable `even` be initialized to the array `[2]`.

On line `5` we invoke the `p` method on `odd`, which outputs `[1,3]` to the console. Finally, on line `6` we invoke `p` on `even`, which outputs `[2]` to the console and also returns `[2]` as the final return value of the code snippet.

This demonstrates the function of the `partition` method, and how it interacts with a block.


# Section 7  - truthyness #

* Example 1 *
*4:33*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```


This code returns `nil` and outputs the value `'Hello is truthy'`. This examples demonstrates the concepts of `falsy` and `truthy` in Ruby. Two values evaluate as `false` in Ruby: `false` and `nil`. Every other value evaluates as `true`. 

Therefore, strings like the string object `'hello'`, which we initialize the local variable `a` to on line `1`, evaluate as `true`

When we evaluate the `if/else/end` expression on lines `3-7`, the `if` clause is passed as a result of this `'truthyness'`

The value `nil` is returned because this is the return value of the `puts` method, which constitutes the last expression evaluated in this example.


* Example 2 *
*5:33*
What does the following code return? What does it output? Why? What concept does it demonstrate?

```
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

This code returns `nil`, and outputs the string `interview`.

On line `5`, we initialize a local variable `var`, to the return value of invoking the method `test`. The definition for this method is found on lines `1-3`.

The return value of this method is `nil`, because the last (and only) expression of the method invokes the `puts` method which always returns `nil`. 

Then when we evaluate the `if/else/end` expression found on lines `7-11`, we do not pass the `if` clause, so we execute the `'then'` statement for this clause, found on line `10`.

This demonstrates the differences between return values and console outputs, like those from the `puts` method, as well as the concepts of `truthy` and `falsy` - i.e. that all values in Ruby other than `false` and `nil` evaluate as `true`.


# Section 8 - puts vs return #

* Example 1 *
*3:40*
What does the following code output? What is the return value of `a` and why?

```
a = puts "stuff"
puts a
```

This code outputs two values, in succession:

`"stuff"`
`nil`

`a` does not have a return value because it is a local variables, not an expression. This variable points to the object `nil`

* Example 2 *
*3:27*
What does the following code output and why?

```
def add_three(number)
  return number + 3
  number + 4
end

returned_value = add_three(4)
puts returned_value
```

This code outputs the value `7`. 

On line `6`, we initialize a local variable `returned_value`, to the return value of invoking the method `add_thread` with argument `4`.

The definition of this method is found on lines `1-4`. On line `1`, we assign the passed in argument to a variable `number` which is limited to the scope created by the method definition.

Within the method, the first expression on line `2` results in exiting the method without evaluating the expression on line `3`. The return value is the sum of the value pointed to by `number`, and the value `3`.

in this case, since the argument passed in to `add_thread` is `4`, the return value is `7`. 


# Lesson 4 - Practice Problems, Methods and More Methods #

* Practice Problem 1 *
*5:04*
What is the return value of the select method below? Why?

```
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

The return value of the `select` method is an array containing three items `[1, 2, 3]`

When called on an `Array` object, `select` iterates over the elements in the calling array, and returns a new array containing any elements for which the supplied block returns a value that evaluates as `true`. 

In this case, the return value of the block on each iteration is the string `'hi'`, which evaluates as `true`, as do all values in Ruby other than `nil` and `false`. Another way often used to describe this, is to say that a string like `'hi'` is `truthy`.

Because the return value of the block for this example evaluates as `true` on every iteration, the array returned by `select` contains all elements of the calling array : `[1, 2, 3]`

There was another expression within the block, on line `2` of the code snippet; however, it is irrelevant to determining what `select` returns, as it doesn't affect the final return value of the block, which is what is considered by `select`.

This demonstrates both the function of the `select` method, as well as the concept of `truthy` values in Ruby - all values other than `nil` and `false` evaluate as `true`.

* Practice Problem 2 *
*3:17*
How does count treat the block's return value? How can we find out?

```
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

The method `count` keeps a running total of the numnber of times the supplied block returns a value that evaluates as `true`. We can confirm this by consulting the Ruby documentation, and/or testing the code snippet out.

In this example, the block compares the length of the value on each iteration against the value `4` and returns `true` if the length is strictly less than `4`, otherwise `false`. 

In the calling array in this example there are 2 elements for which the block returns `true`, so `count` returns the value `2`.

* Practice Problem 3 *
*4:11*
What is the return value of reject in the following code? Why?

```
[1, 2, 3].reject do |num|
  puts num
end
```

The return value of `reject` in this code is an array with 3 elements: `[1, 2, 3]`

`reject` iterates over the elements in the calling collection (an `Array` object with three elements, in this case) and returns an array that includes those elements for which the return value of the block evaluates as `false`.

The block supplied in this code returns `nil` on each iteration, as this is the return value of the invocation of the `puts` method on line `2`. Because `nil` evaluates as `false`, all of the elements from the calling array are included in the returned array.

This demonstrates the function of the `reject` method, along with the `falsy` nature of the value `nil` in Ruby - `nil` evaluates as `false`.

* Practice Problem 4 *
*6:30*
What is the return value of each_with_object in the following code? Why?

```
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

This code returns a hash object with three key/value pairs, as follows `{"ant" => :a, "bear" => :b, "cat" => :c}` ; it outputs nothing.

On line `1` we invoke the method `Enumerable#each_with_object` on a hash, with an empty hash object `{}` as the argument. This method iterates over the calling hash and updates the passed in object (a hash in this case), based on any expressions executed in the block. 

On line `2` we add a key/value pair to the method argument hash - specifically, reversing the key and value from the calling hash, such that the key of the calling hash becomes the value of the argument hash, and the value of the calling hash becomes the key of the argument hash.

The final return value of the `each_with_object` method is the object passed in as argument, with all the updates applied through each iteration included.

This demonstrates the function of the `each_with_object` method, along with syntactic sugar in the form of the 
`|(key, value), hash|` declaration of the block variables.

* Practice Problem 5 *
*1:51*
What does shift do in the following code? How can we find out?

```
hash = { a: 'ant', b: 'bear' }
hash.shift
```

The `Hash#shift` method mutatively removes the first key/value pair found in the calling hash and returns it as a two-item array. In this case, the return value of line `2` is `[:a, 'ant']`. The final value of the local variable `hash` after this code completes is { b: 'bear' }

We can consult the Ruby documentation, and/or test the code snippet out in a REPL, in order to confirm the function of this method.

* Practice Problem 6 *
*3:04*
What is the return value of the following statement? Why?

```
['ant', 'bear', 'caterpillar'].pop.size
```

The return value of this expression is the value `11`. This is an example of chained method invocations:

First, the `pop` method is called on an array with three string objects. This method destructively removes the last element in the array, `'caterpillar'`, and returns that string. (This leaves the calling array with two items: `['ant', 'bear']`)

Second, the `size` method calculates the number of characters in the calling string. `'caterpillar'` has 11 characters, so the final return value is `11`


* Practice Problem 7 *
*5:25*
What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

The block's return value in this code is a boolean value - `true` or `false`. This is because the return value of a block is the return value of the last expression of the block, which in this case is `any?`

In this example, we assign each element from the calling array of the invocation of the `any?` method on line `1`, to the block variable `num`, and then invoke the `odd?` method on the value this variable points to.

The return value of `any?` is also a strict boolean value - `true` if at the block returns a value that evaluates as `true` for at least one element from the calling array, and `false` otherwise. 

In this case, `any?` returns `true` - after just the first iteration, due to the `short-circuit logic` of `any?`, which acts as a sort of group `OR` expression. The output from this code is just the first value from the calling array, since after this first iteration, `any?` stops iterating and returns `true`:

`1`

* Practice Problem 8 *
*2:02*
How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

We can consult the Ruby documentation for the `Array#take` method, or by testing in a repl

`take` returns a new array - therefore it is not destructive.

The new array contains the first `n` elements from the calling array, where `n` is the argument supplied to the invocation of `take`. In this case, the return value is the array `[1, 2]`

* Practice Problem 9 *
*4:01*
What is the return value of map in the following code? Why?

```
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

The return value is an array containing 2 items: `[nil, 'bear']`

The `Enumerable#map` method iterates over the calling collection (in this case, a hash), and returns an array containing the return value of the block on each iteration. 

The return value of the block here is the return value of the `if/end` conditional lines `2-4`. The first iteration through the calling hash fails the conditional, which results in a return value of `nil`. The second iteration passes the conditional, which results in a return value equal to the expression on line `3`, which is the string `'bear'`. 


* Practice Problem 10 *
*4:28*
What is the return value of the following code? Why?


[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

The return value of this code is an array containing three elements: `[1, nil, nil]`. 

The `map` method iterates over the calling collection (an array, in this case), and returns a new array containing the return value of the block on each iteration.

In this example, the return value of the block is determined by the `if/else/end` conditional on lines `2-6`:
  `nil` if the `if` clause is passed
  The current value of the block local variable `num`, otherwise

The first iteration through the calling array assigns the value `1` to the block variable `num`. This value fails the `if` clause so the first value of the array returned by `map` is `1`. 

The 2nd and 3rd iterations through the calling array both pass the `if` clause, so the corresponding elements in the array returned by `map` are both the value `nil`.

# Sort #

```
arr = ['340', '15', '1', '3400']

arr.sort # => ['1', '15', '340', '3400']
```

Which of the following statements most accurately describes why that particular return value is produced?

The `Array#sort` method returns a new array with the elements from the calling array sorted; the sorting logic can be supplied via a block, but otherwise the default is to sort using the `<=>` operator for the object class of the elements being sorted - in this case, strings.

`String #<=>` compares strings by comparing each individual character by ASCII position. If two strings have unequal length and are equal up through all the characters of the shorter string, the longer string is considered to be `'greater'`




*from quiz*

The `Array#sort` method sorts items by using comparison. The comparison is carried out using the appropriate comparison method for the item type, in this case the String#<=> method. The strings are compared character by character according to ASCII position. Longer strings are considered greater if the strings are equal when compared up to the shortest length.

# Lesson 3 - Practice Problems #

* Question 1 *
*2:14*
Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

Take a look at the following code and predict the output:

```
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```

Lines `5` and `7` will produce the same output, while line `6` will produce a different value (the exact values themselves are console dependent)

The key to this problem is that, while the strings we initialize local variables `a` and `b` to on lines `1-2` have the same value, they are not the same object, and therefore will have a different object_id.

The initialization of `c` on line `3` points `c` to the same object that `a` is pointing to, therefore invoking `object_id` on `c` will have the same result as calling it on `a`.

* Question 3 *
*8:32*
Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

```
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

The output from line `10` will be `"My string looks like this now: 'pumpkins'".

The output from line `11` qill be '"My array looks like this now: ['pumpkins', 'rutabega']"

On lines `6-7`, we initialize two local variables: `my_string`, to a `String` object with value `'pumpkins'`, and an `Array` object with one element: `["pumpkins"]`

We then invoke a method `tricky_method` on line `8`, passing in `my_string` and `my_array` as arguments, in that order. 

The definition for this method is found on lines `1-4`. It has two parameters, and invokes a method on each of them in succession. The first argument passed in to the method is assigned to a local variable `a_string_param`, while the second argument is assigned to another local variable `an_array_param`. Both of these variables are initialized within the inner scope created by the method definition.

On line `2`, we reassign the `a_string_param` variable to a new object, which contains the previous object's value, plus the value "rutabega". The `+=` syntax is syntactical sugar for `a_string_param = a_string_param + "rutabega"`. This act of reassignment removes the variable binding of `a_string_param` from the object that the outer scoped variable `my_string` points to; therefore, `my_string` is left unchanged.

On line `3`, we destructively add a second element to the method variable `an_array_param`. This variable points to the same array object that the outer scoped variable `my_array` points to.


* Question 6 *
What is the output of the following code?

```
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

* Question 9 *
Consider these two simple methods:

```
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```
bar(foo)
```