# Arithmetic Integer

# Write a program that prompts the user for two positive integers, 
# and then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

def prompt(msg)
  puts "==> #{msg}"
end

prompt "Enter the first number"
num1 = Integer(gets) rescue nil
prompt "Enter the second number"
num2 = Integer(gets) rescue nil
nums = [num1, num2]

prompt "#{num1} + #{num2} = #{nums.inject(:+)}"
prompt "#{num1} - #{num2} = #{nums.inject(:-)}"
prompt "#{num1} * #{num2} = #{nums.inject(:*)}"
prompt "#{num1} / #{num2} = #{nums.inject(:/)}"
prompt "#{num1} % #{num2} = #{nums.inject(:%)}"
prompt "#{num1} ** #{num2} = #{nums.inject(:**)}"


## Example ##

=begin

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

=end

## * Note - user submitted solution with iteration over an array of operations

=begin

def prompt(str)
  puts ">> #{str}" 
end

nums = []
operations = [:+, :-, :*, :/, :%, :**]

prompt('first num?')
nums << gets.to_i
prompt('second num?')
nums << gets.to_i

operations.each do |op|
  prompt("#{nums[0]} #{op} #{nums[1]} = #{nums.inject(op)}")
end

=end