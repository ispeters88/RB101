# Twenty One

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

def deal_hands!(deck)
  player_hand, dealer_hand = Array.new(2) { Hash.new }
  current_turn = :player

  loop do
    current_hand = current_turn == :player ? player_hand : dealer_hand
    deal_card!(current_turn, current_hand, deck)
    break if player_hand.size == 2 && dealer_hand.size == 2
    current_turn = switch_turn(current_turn)
  end

  [player_hand, dealer_hand]
end

def deal_card!(turn, hand, deck)
  card = deck.pop
  card_num = hand.size + 1
  hand[card_num] = { card: card,
                     score: get_card_score(hand, card),
                     visible: visible?(turn, hand.size) }
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

def get_card_score(hand, card)
  if card.match?(FACE_CARDS)
    card == ACE ? get_score_for_ace(hand) : 10
  else
    card.to_i
  end
end

def get_score_for_ace(hand)
  current_score = get_hand_score(hand)
  current_score > 11 ? 1 : 11
end

def get_hand_score(hand)
  hand.inject(0) { |score, (_, details)| score + details[:score] }
end

def display_hands(player_hand, dealer_hand)
  prompt "Dealer has: #{display_cards(dealer_hand)}. Score is #{get_hand_score(dealer_hand)}"
  prompt "You have: #{display_cards(player_hand)}. Score is #{get_hand_score(player_hand)}"
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

def player_turn!(player_hand, dealer_hand, deck)
  loop do
    choice = hit_or_stay
    if choice == 'h'
      deal_card!(:player, player_hand, deck)
      display_hands(player_hand, dealer_hand)
    end
    break if choice == 's' || bust?(player_hand)
  end
end

def twenty_one?(hand)
  get_hand_score(hand) == WINNING_SCORE
end

def bust?(hand)
  get_hand_score(hand) > WINNING_SCORE
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

def dealer_turn!(dealer_hand, player_hand, deck)
  loop do
    break if get_hand_score(dealer_hand) > COMPUTER_STAY
    deal_card!(:computer, dealer_hand, deck)
    display_hands(player_hand, dealer_hand)
  end
end

def get_game_result(player_hand, dealer_hand)
  player_score = get_hand_score(player_hand)
  dealer_score = get_hand_score(dealer_hand)
  prompt "Your score: #{player_score}\nComputer score: #{dealer_score}"
  if bust?(dealer_hand)
    prompt "The dealer busted. You win!"
  elsif player_score == dealer_score
    prompt "Its a push"
  elsif player_score > dealer_score
    prompt "You won!"
  else
    prompt "You lost"
  end
end

prompt "Welcome to Twenty-One! This is a simplified version of Blackjack"

loop do
  prompt "Shuffling and dealing cards..."
  sleep(1)

  deck = initialize_deck
  shuffle_deck!(deck)

  player_hand, dealer_hand = deal_hands!(deck)

  display_hands(player_hand, dealer_hand)
  player_turn!(player_hand, dealer_hand, deck)
  display_hands(player_hand, dealer_hand)

  if bust?(player_hand)
    prompt "You busted!"
  else
    dealer_turn!(dealer_hand, player_hand, deck)
    get_game_result(player_hand, dealer_hand)
  end

  prompt "Would you like to play again?"
  repeat = gets.chomp.downcase
  break unless repeat.start_with?('y')
end
