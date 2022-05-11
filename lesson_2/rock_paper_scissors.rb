require "pry"

VALID_CHOICES = ['rock', 'paper', 'scissors']

WINNING_COMBOS = [['rock', 'scissors'],
                  ['paper', 'rock'],
                  ['scissors', 'paper']],

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def display_results(player, computer)
  binding.pry
  if WINNING_COMBOS[0].include?([player, computer])
    prompt("You won!")
  elsif WINNING_COMBOS[0].include?([computer, player])
    prompt("You lost.")
  else
    prompt("You tied")
  end
end

=begin
overly complex logic, if statement prior to "things to consider #4
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt("You lost")
  else
    prompt("You tied")
  end
=end

choice = nil

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')} ")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That was not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  repeat = Kernel.gets().chomp()
  break unless repeat.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

# Things to consider
=begin
1. order of method definitions - we can move display_results above prompt, because we don't call it until later in main,
after the definition of prompt has been loaded

2. If we call test_method before we define prompt, we raise a NoMethodError exception. 

3. How to use display_results if it returned a value instead of outputting it to the console
  a] first, we would preferably call it results() rather than display_results, since the latter implies that we are outputting
  something to the console
  b] then we would change the way we call the method, eg:
    puts results(choice, computer_choice)

4. how to reduce complexity of if statement in display_results


=end