# Squaring an Argument

# Using the multiply method from the "Multiplying Two Numbers" problem, 
# write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(first, second)
  first * second
end

def square(num)
  multiply(num, num)
end

## Example ##

square(5) == 25
square(-8) == 64

# further exploration

def power(num, exp)
  result = 1

  exp.times { result = multiply(result, num) }
  result
end

p power(2, 4)