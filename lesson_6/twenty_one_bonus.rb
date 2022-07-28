# Twenty One - With Bonus Features

## >> 2) In the LS suggested solution, the third call to play_again? is different because its return value determines
#        whether the outer loop will continue or break. The prior calls to play_again? determine if the program flow
#        will continue to the next set of commands, or break.

require "pry-byebug"

PLAYERS = [:player, :dealer]
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
FACE_CARDS = /[JQKA]/
ACE = 'A'
NUMBERS = CARDS.select { |card| !card.match?(FACE_CARDS) }
FACE_CARD_NAMES = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
WINNING_SCORE = 21
COMPUTER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARDS * 4
end

def shuffle_deck!(deck)
  5.times do
    deck.shuffle!
  end
end

def deal_hands!(deck, scores)
  player_hand, dealer_hand = Array.new(2) { Hash.new }
  current_turn = :player

  loop do
    current_hand = current_turn == :player ? player_hand : dealer_hand
    deal_card!(current_turn, current_hand, deck, scores)
    break if player_hand.size == 2 && dealer_hand.size == 2
    current_turn = switch_turn(current_turn)
  end

  [player_hand, dealer_hand]
end

def deal_card!(turn, hand, deck, scores)
  card = deck.pop
  card_num = hand.size + 1
  hand[card_num] = { card: card,
                     score: get_card_score(card, scores[turn]),
                     visible: visible?(turn, hand.size) }
  scores[turn] += hand[card_num][:score]
end

def visible?(turn, hand_size)
  !(turn == :dealer && hand_size == 0)
end

def switch_turn(current_turn)
  PLAYERS.reject { |turn| turn == current_turn }.first
end

def get_card_name(card)
  NUMBERS.include?(card) ? card : FACE_CARD_NAMES[card]
end

def get_card_score(card, score)
  if card.match?(FACE_CARDS)
    card == ACE ? get_score_for_ace(score) : 10
  else
    card.to_i
  end
end

def get_score_for_ace(score)
  score >= 11 ? 1 : 11
end

def display_hands(player_hand, dealer_hand, scores)
  prompt "Dealer has: #{display_cards(dealer_hand)}"
  prompt "You have: #{display_cards(player_hand)}. Score is #{scores[:player]}"
end

def display_cards(hand)
  cards = hand.map do |_, card_details|
    card_details[:visible] ? get_card_name(card_details[:card]) : "unknown card"
  end.sort
  joinand(cards)
end

def joinand(arr, separator=', ', conj='and')
  if arr.size == 1
    arr.join
  else
    arr.first(arr.size - 1).join(separator).concat(" #{conj} #{arr.last}")
  end
end

def player_turn!(player_hand, dealer_hand, deck, scores)
  loop do
    choice = hit_or_stay
    if choice == 'h'
      deal_card!(:player, player_hand, deck, scores)
      display_hands(player_hand, dealer_hand, scores)
    end
    break if choice == 's' || bust?(scores[:player])
  end
end

def bust?(score)
  score > WINNING_SCORE
end

def hit_or_stay
  choice = nil
  loop do
    prompt "Would you like to hit or stay?"
    choice = gets.chomp.downcase.chr
    break if choice.match?(/[hs]/)
    prompt "That is not a valid choice. Enter hit (h) or stay (s)"
  end
  choice
end

def dealer_turn!(dealer_hand, player_hand, deck, scores)
  loop do
    break if scores[:dealer] > COMPUTER_STAY
    deal_card!(:dealer, dealer_hand, deck, scores)
    display_hands(player_hand, dealer_hand, scores)
  end
end

def get_game_result(scores)
  if bust?(scores[:dealer]) || scores[:player] > scores[:dealer]
    :player
  elsif scores[:player] == scores[:dealer]
    :push
  else
    :dealer
  end
end

def display_game_result(result, scores)
  final_score = get_final_score(scores)
  if result == :player
    prompt "You won!"
  elsif result == :push
    prompt "Its a push"
  else
    prompt "You lost"
  end
  prompt final_score
end

def get_final_score(scores)
  "#{scores[:player]} - #{scores[:dealer]}"
end

def display_round_scores(round_scores)
  prompt "You have won #{round_scores[:player]} times in this round"
  prompt "Dealer has won #{round_scores[:dealer]} times"
end

prompt "Welcome to Twenty-One! This is a simplified version of Blackjack"

loop do
  round_scores = { player: 0, dealer: 0, push: 0 }
  result = nil

  loop do
    prompt "Shuffling and dealing cards..."
    sleep(1)

    deck = initialize_deck
    shuffle_deck!(deck)
    scores = { player: 0, dealer: 0 }

    player_hand, dealer_hand = deal_hands!(deck, scores)

    display_hands(player_hand, dealer_hand, scores)
    player_turn!(player_hand, dealer_hand, deck, scores)
    display_hands(player_hand, dealer_hand, scores)

    scores.each { |hand, score| prompt "#{hand.to_s}'s score is #{score}"}

    if bust?(scores[:player])
      prompt "You busted!"
      prompt get_final_score(scores)
      result = :dealer
      round_scores[:dealer] += 1
    else
      dealer_turn!(dealer_hand, player_hand, deck, scores)
      result = get_game_result(scores)
      round_scores[result] += 1
      display_game_result(result, scores)
    end

    display_round_scores(round_scores)
    break if round_scores[result] == 5 && result != :push
  end

  prompt "The winner of the round is #{result}!"
  prompt "Would you like to play again?"
  repeat = gets.chomp.downcase
  break unless repeat.start_with?('y')
end

prompt "Thanks for playing. Goodbye!"
