# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "pry"
require "yaml"
MESSAGES = YAML.load_file('calc_msgs.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  # bonus feature 1: better int validation
  Integer(num) rescue false
  binding.pry
end

def number?(num)
  # bonus feature 2: enforce float or integer convertible types
  Integer(num) rescue false || Float(num) rescue false
end

def convert_num(num)
  if num.include?('.')
    num = num.to_f
  else
    num = num.to_i
  end
end

def operation_to_message(op)
  # bonus feature #3 - accomodating additional code after case statement
  msg = case op
        when '1'
          'Adding'
        when '2'
          'Subtracting'
        when '3'
          'Multiplying'
        when '4'
          'Dividing'
        end
  # additional code
  # additional code
  msg        
end

prompt(MESSAGES['greeting'])
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}!")

loop do
  number1 = nil
  number2 = nil

  loop do
    prompt(MESSAGES['number1'])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['number2'])
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
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
      prompt(MESSAGES['valid_oper'])
    end
  end

  number1 = convert_num(number1)
  number2 = convert_num(number2)

  prompt("#{operation_to_message(operator)} the two numbers... ")

  binding.pry

  result = case operator
          when '1'
            number1 + number2
          when '2'
            number1 - number2
          when '3'
            number1 * number2
          when '4'
            number1 / number2
          else prompt("Invalid operator value. Goodbye!")
  end

  prompt("The result is #{result}")
  prompt(MESSAGES['repeat'])
  repeat = Kernel.gets().chomp()
  break unless repeat.downcase.start_with?('y') 
end  

prompt(MESSAGES['goodbye'])