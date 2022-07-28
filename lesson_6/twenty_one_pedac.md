# Twenty One

## Data/Algorithm ##

# 1) Setup data structure to hold cards (the "deck")
# 2) Deal cards to player and dealer
# 3) Player's turn - until bust or stay
#     > If bust, stop game, winner is computer
# 4) Dealer's turn - until bust or stay (hand value > 17)
# 5) Determine winner
#     > If computer busts, winner is player


# Data structures for inits #
# > Deck: Array - [card, card, card...]
# > Hands: Hash - {card: {score, visible}}

# Deal hands #
# > Add one visible card to player's hand, along with corresponding score. 
# > Add one invisible card to dealer's hand, with corresponding score.
# > Add one more visible card to player's hand, then to dealer's hand. Include score
#     > In all three cases, sample from "Deck" array to get the card. Remove the card from the array

# Player's turn #
# 1) Display current score
# 2) Prompt player to hit or stay
#     > If hit, deal visible card via "Deck" array sampling. Update score and check for bust
#         > If no bust, repeat step 2
#         > If bust, computer wins
#     > If stay, end player turn