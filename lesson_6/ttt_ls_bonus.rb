require "pry-byebug"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +     # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +     # columns
                [[1, 5, 9], [3, 5, 7]]                  # diagonals
CENTER_SQUARE = 5
PLAYERS = ['Player', 'Computer']


def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize

def display_board(brd)
  #system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  {'Player' => 0, 'Computer' => 0, 'Tie' => 0}
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=', ', conj='or')
  if arr.size == 1
    arr.join
  else
    arr.first(arr.size - 1).join(separator).concat(" #{conj} #{arr.last}")
  end
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  
  WINNING_LINES.each do |line|
    square = defend_or_attack(brd, line)
    break if square
  end

  if !square && brd[CENTER_SQUARE] == INITIAL_MARKER
    square = CENTER_SQUARE
  elsif !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def defend_or_attack(brd, line)
  brd_values = brd.values_at(*line)
  
  if brd_values.count(COMPUTER_MARKER) == line.size - 1
    brd.select { |key, val| line.include?(key) && val == INITIAL_MARKER }.keys.first
  elsif brd_values.count(PLAYER_MARKER) == line.size - 1
    brd.select { |key, val| line.include?(key) && val == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def alternate_player(current_player)
  PLAYERS.reject { |player| player == current_player }.first
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == line.size
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == line.size
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def round_over?(scores)
  scores.reject { |player, score| player == 'Tie' }.value?(5)
end

loop do
  scores = initialize_score
  current_player = PLAYERS.sample
  prompt "#{current_player} will play first. First to 5 wins!"

  loop do
    prompt "First to 5 wins!"
    board = initialize_board

    loop do
      prompt "It is #{current_player}'s turn"
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      scores[winner] += 1
      prompt "#{winner} won!"
    else
      prompt "It's a tie!"
      scores["Tie"] += 1
    end
  
    prompt "The score is:"
    scores.each { |player, score| prompt "#{player}: #{score}"}
    break if round_over?(scores)
    end

  round_winner = scores.each
  prompt "The round winner is #{scores.key(5)}"
  prompt "Play again? (y/n)"
  answer = gets.chomp

  break unless answer.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye"