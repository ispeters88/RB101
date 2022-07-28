# Stack Machine Interpretation

## Problem ##
# input - string containing a sequence of commands
# output - result of command(s) as defined in spec below
# rules/reqs
# questions

## list of commands ##
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

## Data/Algorithm ##
# > Given a string of well-defined commands, str -
#     1) Define the commands (see command list above)
#     2) Initialize a number to 0 - register
#     3) Initialize an empty array - stack
#     4) Split the string (by whitespace) into an array cmd_arr
#     5) Iterate over the strings within cmd_arr
#     6) On each iteration, update register and stack with the values determined by the command definition
             
require "pry-byebug"

def minilang(cmds)
  register, stack = [0, []]

  cmd_arr = cmds.split
  cmd_arr.each do |cmd|
    register, stack = run_command(cmd, register, stack)
  end
end

def run_command(cmd, register, stack)
  #binding.pry
  case cmd
  when /[0-9]/ then register = cmd.to_i
  when 'PUSH' then stack.push(register)
  when 'ADD' then register += stack.pop.to_i
  when 'SUB' then register -= stack.pop.to_i
  when 'MULT' then register *= stack.pop.to_i
  when 'DIV' then register /= stack.pop.to_i
  when 'MOD' then register = register % stack.pop.to_i
  when 'POP' then register = stack.pop.to_i
  when 'PRINT' then p register
  end
  [register, stack]
end



## Examples ##

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


## Further Exploration ##
# Try writing a minilang program to evaluate and print the result of this expression:

def minilang_fe(cmds)
  register, stack = [0, []]

  #binding.pry
  cmd_arr = cmds.split
  cmd_arr.each do |cmd|
    begin
    register, stack = run_command_fe(cmd, register, stack)
    rescue TypeError
      puts "Popping off an empty stack will throw an error in this machine"
    rescue ZeroDivisionError
      puts "That command sequence results in division by 0"
    end
  end
end

def run_command_fe(cmd, register, stack)
  case cmd
  when /[0-9]/ then register = cmd.to_i
  when 'PUSH' then stack.push(register)
  when 'ADD' then register += stack.pop
  when 'SUB' then register -= stack.pop
  when 'MULT' then register *= stack.pop
  when 'DIV' then register /= stack.pop
  when 'MOD' then register = register % stack.pop
  when 'POP' then register = stack.pop
  when 'PRINT' then p register
  else
    puts "#{cmd} is not a valid command!"
  end
  [register, stack]
end


#minilang_fe('5 ADD PRINT')
#minilang_fe(' PUSH 5 PUSH 3 MOD DIV PRINT')
minilang_fe('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH 7 PUSH 0 SUB ADD DIV PRINT')