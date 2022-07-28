# Card Deck

# We started working on a card game but got stuck. Check out why the code below raises a TypeError.
# 
# Once you get the program to run and produce a sum, you might notice that the sum is off: 
# It's lower than it should be. Why is that?

require "pry-byebug"

## ORIGINAL CODE ##
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card|
    score(card)
  end.sum

  sum += remaining_cards.sum
end

puts sum


## NEW CODE ##

## >> Change the map call within the reduce function to the mutating form
## >> Also change the initialization of the deck so that we aren't using the same cards array object for each suit

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map! do |card|
    score(card)
  end.sum

  sum += remaining_cards.sum
end

puts sum


## EXPLANATION ##
# > Using map! (on line 84) ensures that the remaining_cards array we are calling sum on contains integer values, 
# rather than the cards themselves, which include symbol values

# > Using #clone when building the initial deck ensures that the array of cards used for each suit is a different object
# this way, when we mutate a suit's remaining cards, we aren't affecting the other suits as well
