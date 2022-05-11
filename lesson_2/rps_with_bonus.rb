require "pry"

VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  l: 'lizard',
                  sp: 'spock' }

WINNING_COMBOS = { rock: ['lizard', 'scissors'],
                   paper: ['rock', 'spock'],
                   scissors: ['paper', 'lizard'],
                   lizard: ['spock', 'paper'],
                   spock: ['scissors', 'rock'] }

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def get_winner(player, computer)
  if WINNING_COMBOS[player.to_sym].include?(computer)
    'player'
  elsif WINNING_COMBOS[computer.to_sym].include?(player)
    'computer'
  else
    'tie'
  end
end

def display_results(winner)
  if winner == 'player'
    prompt("You won!")
  elsif winner == 'computer'
    prompt("You lost.")
  else
    prompt("You tied")
  end
end

choice = nil
winner = nil
scores = { player: 0, computer: 0, tie: 0 }
score_prompt = nil

loop do
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.keys.include?(choice.to_sym)
        choice = VALID_CHOICES[choice.to_sym]
        break
      elsif VALID_CHOICES.values.include?(choice)
        break
      else
        prompt("That was not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample()

    prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

    winner = get_winner(choice, computer_choice)
    display_results(winner)
    scores[winner.to_sym] += 1

    score_prompt = <<-MSG
    Player - #{scores[:player]}
    Computer - #{scores[:computer]}
    Ties - #{scores[:tie]}
    MSG

    prompt("Current score:")
    prompt(score_prompt)

    break if winner != 'tie' && scores[winner.to_sym] == 3
  end

  prompt("The winner is #{winner}! Final scores: ")
  prompt(score_prompt)

  prompt("Do you want to play again?")
  repeat = Kernel.gets().chomp()
  break unless repeat.downcase().start_with?('y')

  prompt("Clearing the scoreboard...")
  scores.each_key { |key| scores[key] = 0 }
end

prompt("Thank you for playing. Goodbye!")
