# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name: ")
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a valid name")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do
  number1 = nil
  number2 = nil

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt("Hmm ... that doesn't appear to be a valid non-0 integer value")
    end
  end

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt("Hmm ... that doesn't appear to be a valid non-0 integer value")
    end
  end

  operator = nil

  operator_prompt = <<-MSG
  What operation would you like to perform? Enter 1, 2, 3, or 4:
  1: add
  2: subtract
  3: multiply
  4: divide
  MSG

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers... ")

  result = case operator
          when '1'
            number1.to_i() + number2.to_i()
          when '2'
            number1.to_i() - number2.to_i()
          when '3'
            number1.to_i() * number2.to_i()
          when '4'
            number1.to_f() / number2.to_f()
          else prompt("Invalid operator value. Goodbye!")
  end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  repeat = Kernel.gets().chomp()
  break unless repeat.downcase.start_with?('y') 
end  

prompt("Thank you for using the calculator. Good bye!")



=begin

Additional things to think about

1. Is there a better way to validate that the user has input a number? 
  Kernel#Integer(input) could be one approach - this will raise an ArgumentError if the input is not convertible to an Int


3. Our operation_to_message method is a little dangerous, 
because we're relying on the case statement being the last expression in the method. 
What if we needed to add some code after the case statement within the method? 
What changes would be needed to keep the method working with the rest of the program?

  We could bind the case statement to a variable and then return that variable at the end of the method
    result = case ...
    return result

=end