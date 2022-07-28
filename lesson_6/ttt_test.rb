arr = [[1, 2, 3, 4],
       [4, 5, 6, 7],
       [7, 8, 9, 10],
       [11, 12, 13, 14]]



## Problem ##
# Restatement > A square 2D array (3x3 or greater) contains two possible values - call them A and B.
#               If we envision the outer array laid out as a square, with the subarrays forming each row of values,
#               the goal of this method is to check if there is a "straight line" of matching values, that is of length s
#                 s is the size of the outer array (this should match the size of the subarrays as well, of course)
#               There are three possible "straight lines" in our square 2D array:
#                   1) horizontal
#                   2) vertical
#                   3) diagonal
#               Given such a square 2D array, return the winner if there is one, else return "tie"

#               
## Data/Algorithm ##
#   > Describing the three types of "straight lines" in terms of our 2D square array
#       1) horizontal: each subarray of the outer array
#       2) vertical: each subarray of the transposed version of the outer array
#       3) diagonal: huh?

=begin
def winning_combos(board)
  winning_combos = Array.new
  size = board.size

  board.each { |row| winning_combos << row }
  board.transpose.each { |row| winning_combos << row }
  winning_combos << (0..size-1).collect { |idx| board[idx][idx] }
  winning_combos << (0..size-1).collect { |idx| board[idx][size - 1 - idx] }

  winning_combos

end

def winner?(board, symbol)
  winning_combos = get_winning_combos(board)
  winning_combos.any? { |subarr| subarr.all? { |mark| mark == symbol} }
end
=end

=begin
def initialize_board_3
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_board_3(brd)
  system 'clear'
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

loop do
  puts "What size board? (3 or greater)"
  size = Integer(gets) rescue 0
  break if size > 2
  puts "Must enter an integer 3 or greater"
end

initialize_board_3
display_board_3(brd)
=end

require "pry-byebug"

INITIAL_MARKER = ''
TERMINAL_WIDTH = 80

def initialize_board(size)
  # initialize board (2D square array) with " " as the values within the subarrays
  Array.new(size) { Array.new(size, INITIAL_MARKER) }
end

def display_scoring_rows(brd, row, size)
  marker_row = ''
  brd[row].each_index do |square| 
    marker_row << ("   #{brd[row][square]}  |")
  end
  puts marker_row.chop
end


def display_board(brd, size)
  spacer = ("     |" * size).chop
  divider = ("-----\+" * size).chop

  (0..size - 1).each do |num|
    puts spacer
    display_scoring_rows(brd, num, size)
    puts spacer
    puts divider if num < size - 1
  end

  #puts ""
  #puts spacer
  #puts "Xs or Os here"
  #puts spacer
  #puts divider
#
  #puts spacer
  #puts "Xs or Os here"
  #puts spacer
  #puts divider
#
  #puts spacer
  #puts "Xs or Os here"
  #puts spacer

end

puts "size?"
size = Integer(gets) rescue 0
board = initialize_board(size)
display_board(board, size)


# this is just temporary. delete later!

=begin
TERMINAL_WIDTH = 80
INITIAL_MARKER = ' '


def prompt(msg)
  puts ">> #{msg}"
end

def initialize_board(size)
  # initialize board (2D square array) with " " as the values within the subarrays
  Array.new(size) { Array.new(size, INITIAL_MARKER) }
end

def initialize_scores
  {player: 0, computer: 0, tie: 0}
end

def valid_mark?(mark)
  mark == 'X' || mark == 'O'
end

def valid_num?(num, board_size)
  (0..board_size).include?(num)
end

def get_marks
  player_mark = nil

  loop do
    prompt "Would you like to be X's or O's? Enter X or O"
    player_mark = gets.chomp.upcase
    break if valid_mark?(player_mark)
    prompt "The only options are X and O!"
  end
  
  computer_mark = (player_mark == "X" ? "O" : "X")
  {player: player_mark, computer: computer_mark}
end

def rows_with_empty_squares(board)
  board.select { |row| row.include?(INITIAL_MARKER) }
end

def empty_squares(row)
  row.select { |value| value == INITIAL_MARKER }
end

def display_scoring_rows(brd, row, size)
  marker_row = ''
  brd[row].each_index do |square| 
    marker_row << ("  #{brd[row][square]}  |")
  end
  puts marker_row.chop
end

def display_board(brd, size)
  spacer = ("     |" * size).chop
  divider = ("-----\+" * size).chop

  (0..size -1).each do |num|
    puts spacer
    display_scoring_rows(brd, num, size)
    puts spacer
    puts divider if num < size -1
  end
end

def display_turn_results(turn, row, square)
  if turn[:player]
    prompt "You selected row #{row +-1} and square #{square +-1}"
  else
    prompt "The computer selected row #{row +-1} and square #{square +-1}"
  end
end

def display_game_results(result)
  if result == "player"
    prompt "Congratulations! You beat the computer! It is not programmed to be very smart though, so big whup"
  elsif result == "computer"
    prompt "Womp womp, you lost to the computer. Better luck next time!"
  else
    prompt "It was a tie. Boring!"
  end
end

def display_scores(scores)
  prompt "The score is:"
  scores.each { |player, score| prompt "#{player}: #{score}"}
end

def joinor(arr, separator=', ', conj='or')
  if arr.size ==1
    arr.join
  else
    arr.first(arr.size - 1).join(separator).concat(" #{conj} #{arr.last}")
  end
end

def play_turn(turn, board, size)
  if turn[:player]
    row_choice, square_choice = user_selection(board, size)
  else
    row_choice, square_choice = computer_selection(board, size)
  end

  [row_choice, square_choice]
end

def user_selection(board, board_size)
  prompt "It is your turn"
  row_choice = nil
  square_choice = nil

  loop do

    loop do
      prompt "What row would you like to play in? Enter "
      row_choice = Integer(gets) - 1 rescue 0
      break if valid_num?(row_choice, board_size)
      prompt "The instructions were pretty clear!"
    end

    loop do
      prompt "Select a square in row #{row_choice.to_s}."
      binding.pry
      prompt "Choose a square (#{joinor(empty_squares(board[row_choice]))})"
      # ?? 
      square_choice = Integer(gets) - 1 rescue 0
      break if valid_num?(square_choice, board_size)
      prompt "Oh goodness, are you incapable of following directions?!"
    end
    
    break if board[row_choice - 1][square_choice - 1] == " "
    prompt "Uh oh! Looks like that square is already taken"
    sleep(1)
  end

  [row_choice - 1, square_choice - 1]
end

def computer_selection(board, size)
  row_choice = nil
  square_choice = nil

  loop do
    row_choice, square_choice = Array.new(2, rand(size))
    break if board[row_choice][square_choice] == " "
  end

  [row_choice, square_choice]
end

def get_winning_combos(board, size)
  winning_combos = Array.new

  board.each { |row| winning_combos << row }
  board.transpose.each { |row| winning_combos << row }
  winning_combos << (0..size-1).collect { |idx| board[idx][idx] }
  winning_combos << (0..size-1).collect { |idx| board[idx][size - 1 - idx] }

  winning_combos
end

def update_board!(board, row, square, mark)
  board[row][square] = mark
end

def game_over?(board, marks, turn)
  !!check_game_result(board, marks, turn)
end

def check_game_result(board, marks, turn)
  if winner?(board, marks[turn.key(true)])
    turn.key(true).to_s
  elsif board.flatten.select { |mark| mark == " "}.empty?
    "tie"
  else
    nil
  end
end

def winner?(board, symbol)
  winning_combos = get_winning_combos(board, board.size)
  winning_combos.any? { |subarr| subarr.all? { |mark| mark == symbol} }
end

def round_over?(scores)
  scores.reject { |player, score| player == :tie }.value?(5)
end

def get_winning_lines(size)
  winning_combos = Array.new

  board.each { |row| winning_combos << row }
  board.transpose.each { |row| winning_combos << row }
  winning_combos << (0..size-1).collect { |idx| board[idx][idx] }
  winning_combos << (0..size-1).collect { |idx| board[idx][size -1 - idx] }

  winning_combos
end

prompt "Welcome to Tic Tac Toe!\n".center(TERMINAL_WIDTH)
prompt "Here is the board. Note the row labels on the right hand side of each row".center(TERMINAL_WIDTH)
prompt "You will use these to identify where you place your marker\n".center(TERMINAL_WIDTH)

loop do
  prompt "What board size shall we play?"
  board_size = gets.chomp.to_i
  board = initialize_board(board_size)
  turn_id = {player: true, computer: false}
  marks = get_marks
  result = nil
  scores = initialize_scores

  loop do
    display_board(board, board_size)

    loop do
      row_choice, square_choice = play_turn(turn_id, board, board_size)
      display_turn_results(turn_id, row_choice, square_choice)
      update_board!(board, row_choice, square_choice, marks[turn_id.key(true)])

      break if game_over?(board, marks, turn_id)

      turn_id.transform_values!(&:!)

      sleep(1)
      prompt "Here is the updated board"
      display_board(board, board_size)
      sleep(1)

    end

    prompt "The game is over. Calculating result and updating scores... "
    sleep(2)

    result = check_game_result(board, marks, turn_id)

    display_game_results(result)
    scores[result.to_sym] +=-1

    sleep(2)
    prompt "Here is the final board"
    display_board(board, board_size)
    display_scores(scores)

    break if round_over?(scores)
    board = initialize_board(board_size)
  end

  prompt "The winner is #{scores.key(5).to_s}"

  prompt "Would you like to play again? (Yes/no)"
  repeat = gets.chomp.downcase
  break unless repeat.start_with?('y')
end

prompt "Thanks for playing! Goodbye!!"
=end


board = [[1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]]

board_size = board.size

def get_row_and_square(board_size, value)
  row = value % board_size == 0 ? value / board_size - 1 :  value / board_size
  square = value % board_size == 0 ? board_size - 1 : value % board_size
end

[1, 5, 9].each { |val| get_row_and_square(board_size, val) }
#0, 0
#1, 1
#2, 2

[3, 5, 7]
#0, 2
#1, 1
#2, 0

[4, 5, 6]
#1, 0
#1, 1
#1, 2



def update_board!(board, size, square, mark)
  binding.pry
  square = get_row_and_col(size, square)
  board[square] = mark
end