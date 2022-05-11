# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

number2 = nil
operator = nil

loop do
  Kernel.puts("What's the second number?")
  number2 = Kernel.gets().chomp()
  Kernel.puts("What operation would you like to perform? Enter 1, 2, 3, or 4: 1) add 2) subtract 3) multiply 4) divide")
  operator = Kernel.gets().chomp()
  break if number2 != '0' || operator != '4'
  Kernel.puts("This will result in a divide by 0 error. If you want to use divide, don't enter 0 for the 2nd number!")
end

puts operator.inspect

case operator
when '1' then result = number1.to_i() + number2.to_i()
when '2' then result = number1.to_i() - number2.to_i()
when '3' then result = number1.to_i() * number2.to_i()
when '4' then result = number1.to_f() / number2.to_f()
else Kernel.puts("Invalid operator value. Goodbye!")
end

Kernel.puts("The result is #{result}")