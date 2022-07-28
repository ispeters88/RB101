## Tic Tac Toe ##
# > Implementing bonus features
# A few of the suggested bonus features were already present in my original program, or are irrelevant due
# to design differing from the LS solution:
#   * -1) - my solution asks for user input differently than the LS solution, so the "joinor" method is not relevant
#   * (6) - my original solution used a generic play_turn method that calls separate user_selection and computer_selection
#           methods, depending on who has the current turn
# > This version will incorporate #2-5

require "pry-byebug"

TERMINAL_WIDTH = 80
INITIAL_MARKER = ' '
PLAYERS = [:player, :computer]
BEST_OF = 3

def prompt(msg)
  puts "=> #{msg}"
end

def get_setup_data
  prompt "What board size shall we play? Default is 3"
  board_size = Integer(gets) rescue 3
  board = initialize_board(board_size)
  numbered_board = get_numbered_board(board_size)
  marks = get_marks
  current_player = initialize_turn
  scores = initialize_scores
  [board_size, board, numbered_board, marks, current_player, scores]
end

def initialize_board(size)
  # initialize board (2D square array) with " " as the values within the subarrays
  Array.new(size) { Array.new(size, INITIAL_MARKER) }
end

def get_numbered_board(size)
  board = Array.new
  counter = 1

  loop do
    break if counter > size ** 2
    board << (counter..counter + size - 1).to_a
    counter += size
  end

  board
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

def valid_mark?(mark)
  mark == 'X' || mark == 'O'
end

def initialize_turn
  prompt "Who should go first?\n1 - player\n2 - computer\n3 - allow computer to choose"
  turn_choice = Integer(gets) rescue 1
  turn_choice == 3 ? PLAYERS.sample : PLAYERS[turn_choice - 1]
end

def initialize_scores
  {player: 0, computer: 0, tie: 0}
end

def display_board(brd, size)
  header = build_column_headers(size)
  spacer = ("     |" * size).chop
  divider = ("-----\+" * size).chop

  puts "#{header}\n"
  (0..size-1).each do |row|
    puts spacer
    display_scoring_rows(brd, row, size)
    puts spacer
    puts divider if row < size -1
  end
end

def build_column_headers(size)
  header = ''
  (1..size).each do |num|
    header << "  #{num}   "
  end
  header
end

def display_scoring_rows(board, row, size)
  marker_row = ''
  board[row].each_index do |square| 
    marker_row << ("  #{board[row][square]}  |")
  end
  puts marker_row.chop + "   #{row + 1}"
end

def play_turn!(board, size, number_board, player, marks)
  if player == :player
    user_plays!(board, size, marks[player])
  else
    computer_plays!(board, number_board, size, marks)
  end
end

def user_plays!(board, size, mark)
  square = get_square_from_user(board, size, mark)
  row, col = get_row_and_col(size, square)
  board[row][col] = mark
end

def get_square_from_user(board, size, mark)
  row_choice = nil
  col_choice = nil

  loop do
    prompt "What row would you like to play in?"
    row_choice = (Integer(gets) - 1) rescue nil
    prompt "Select a square in row #{(row_choice + 1).to_s}."
    col_choice = (Integer(gets) - 1) rescue nil
    break if valid_row_and_col?(board, row_choice, col_choice, size)
    prompt "Oops! Looks like that row/square combo is not allowed"
  end

  get_square_from_rowcol(row_choice, col_choice, size)
end

def valid_row_and_col?(board, row, col, size)
  valid_nums = [row, col].all? { |num| num.to_s.match?(/[0-board_size]/) }
  square = get_square_from_rowcol(row, col, size)

  valid_nums && empty_squares(board).include?(square)
end

def empty_squares(board)
  empty = Array.new
  board.flatten.each_with_index do |square, idx| 
    empty << idx + 1 if square == INITIAL_MARKER
  end

  empty
end

def get_square_from_rowcol(row_choice, col_choice, size)
  row_choice * size + col_choice + 1
end

def computer_plays!(board, number_board, size, marks)
  square = nil
  threat_lines = get_winning_lines(number_board, size)

  # offense
  square = check_threat_lines(board, size, marks[:computer], threat_lines)

  # defense
  if !square
    square = check_threat_lines(board, size, marks[:player], threat_lines)
  end

  # random
  if !square
    square = get_center_or_random(board, size)
  end

  row, col = get_row_and_col(size, square)
  board[row][col] = marks[:computer]
end

def check_threat_lines(board, size, mark, lines)
  square = nil
  lines.each do |line|
    square = defend_or_attack(board, size, line, mark)
    break if square
  end
  square
end

def defend_or_attack(board, size, line, mark)
  board_values = Array.new
  line.each do |square|
    row, col = get_row_and_col(size, square)
    board_values << board[row][col]
  end

  if board_values.count(mark) == line.size - 1
    get_threat_square(board, size, line)
  else
    nil
  end
end

def get_threat_square(board, size, line)
  line.select do |square|
    row, col = get_row_and_col(size, square)
    board[row][col] == INITIAL_MARKER
  end.first
end

def get_row_and_col(board_size, square)
  row = square % board_size == 0 ? square / board_size - 1 :  square / board_size
  column = square % board_size == 0 ? board_size - 1 : square % board_size - 1
  [row, column]
end

def get_centrish_square(size)
  size.even? ? nil : (size ** 2 + 1) / 2
end

def get_center_or_random(board, size)
  center = get_centrish_square(size)

  if !!center && empty_squares(board).include?(center)
    center
  else
    empty_squares(board).sample
  end

end

##
def display_turn_results(turn, size, square)
  row, col = get_row_and_col(size, square)
  if player == :player
    prompt "You selected row #{row + 1} and square #{square + 1}"
  else
    prompt "The computer selected row #{row + 1} and square #{square + 1}"
  end
end
##


def switch_players(cur_player)
  PLAYERS.reject { |player| player == cur_player }.first
end

def get_game_result(board, marks, player)
  if winner?(board, marks[player])
    player
  elsif board.flatten.select { |mark| mark == " "}.empty?
    :tie
  else
    nil
  end
end

def winner?(board, mark)
  winning_lines = get_winning_lines(board, board.size)
  winning_lines.any? { |line| line.all? { |square| square == mark} }
end

def get_winning_lines(board, size)
  winning_lines = Array.new

  board.each { |row| winning_lines << row }
  board.transpose.each { |row| winning_lines << row }
  winning_lines << (0..size-1).collect { |idx| board[idx][idx] }
  winning_lines << (0..size-1).collect { |idx| board[idx][size -1 - idx] }

  winning_lines
end

def round_over?(scores)
  scores.reject { |player, score| player == :tie }.value?(BEST_OF)
end

prompt "Welcome to Tic Tac Toe!\n".center(TERMINAL_WIDTH)
prompt "Here is the board. Note the row labels on the right hand side of each row".center(TERMINAL_WIDTH)
prompt "You will use these to identify where you place your marker\n".center(TERMINAL_WIDTH)

loop do
  board_size, board, numbered_board, marks, current_player, scores = get_setup_data
  result = nil

  display_board(board, board_size)
  prompt "Game on. First to #{BEST_OF} wins!"

  loop do
    
    loop do
      prompt "It is now the #{current_player.to_s}'s turn"
      play_turn!(board, board_size, numbered_board, current_player, marks)
      sleep(1)
      prompt "Here is the updated board"
      display_board(board, board_size)

      game_result = get_game_result(board, marks, current_player)
      break if !!game_result

      current_player = switch_players(current_player)

    end

    prompt "The game is over. Calculating result and updating scores... "
    sleep(1)
    result = get_game_result(board, marks, current_player)

    if result == :tie
      prompt "Its a tie!"
      scores[:tie] += 1
    else
      prompt "#{result} won!"
      scores[result] += 1
    end

    prompt "The scores are:"
    scores.each { |player, score| prompt "#{player}: #{score}"}

    break if round_over?(scores)
    board = initialize_board(board_size)
    prompt "Losers first!"
    current_player = result == :tie ? initialize_turn : PLAYERS.reject { |player| player == current_player }.first

  end

  prompt "The round winner is #{scores.key(BEST_OF)}"

  prompt "Play again? (y/n)"
  answer = gets.chomp.downcase

  break unless answer.start_with?('y')

end

prompt "Thanks for playing. Goodbye!"