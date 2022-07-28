## Tic Tac Toe ##

TERMINAL_WIDTH = 80

def prompt(msg)
  puts ">> #{msg}"
end

def valid_mark?(mark)
  mark == 'X' || mark == 'O'
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

def valid_num?(choice)
  [1, 2, 3].include?(choice)
end

def display_row(size, markers,row_num)
  # markers is an array containing the markers placed by user/computer
  row = ""
  horizontal = "+#{'-' * 3}+" * size
  row << "#{horizontal}\n"
  markers.each { |mark| row << "| #{mark} |" }
  row << "#{row_num.to_i}\n#{horizontal}"
  puts row
end

def display_board(square)
  size = square.size
  square.each_with_index { |subarr, idx| display_row(size, subarr, idx + 1) }
end

def user_selection(board)
  prompt "It is your turn"
  row_choice = nil
  square_choice = nil

  loop do

    loop do
      prompt "What row would you like to play in? Enter 1, 2, or 3"
      row_choice = gets.chomp.to_i
      break if valid_num?(row_choice)
      prompt "The instructions were pretty clear!"
    end

    loop do
      prompt "Select a square in row #{row_choice.to_s}. Enter 1, 2, or 3"
      square_choice = gets.chomp.to_i
      break if valid_num?(square_choice)
      prompt "Oh goodness, are you incapable of following directions?!"
    end
    
    break if board[row_choice - 1][square_choice - 1] == " "
    prompt "Uh oh! Looks like that square is already taken"
    sleep(1)
  end

  [row_choice - 1, square_choice - 1]
end

def computer_selection(board)
  row_choice = nil
  square_choice = nil

  loop do
    row_choice = rand(3)
    square_choice = rand(3)
    break if board[row_choice][square_choice] == " "
  end

  [row_choice, square_choice]
end

def get_winning_combos(board)
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

def play_turn(turn_id, board)
  if turn_id[:player]
    row_choice, square_choice = user_selection(board)
  else
    row_choice, square_choice = computer_selection(board)
  end

  [row_choice, square_choice]
end

def update_board(board, row, square, mark)
  board[row][square] = mark
end

def reset_board
  # initialize board (2D square array) with " " as the values within the subarrays
  Array.new(3) { Array.new(3, " ") }
end

board = reset_board

prompt "Welcome to Tic Tac Toe!\n".center(TERMINAL_WIDTH)
prompt "Here is the board. Note the row labels on the right hand side of each row".center(TERMINAL_WIDTH)
prompt "You will use these to identify where you place your marker\n".center(TERMINAL_WIDTH)

display_board(board)
turn_id = {player: true, computer: false}

loop do
  
  marks = get_marks
  result = nil

  loop do
    counter = 0
    row_choice, square_choice = play_turn(turn_id, board)

    if turn_id[:player]
      prompt "You selected row #{row_choice + 1} and square #{square_choice + 1}"
    else
      prompt "The computer selected row #{row_choice + 1} and square #{square_choice + 1}"
    end

    update_board(board, row_choice, square_choice, marks[turn_id.key(true)])

    if winner?(board, marks[turn_id.key(true)])
      result = turn_id.key(true).to_s
      break
    elsif board.flatten.select { |mark| mark == " "}.empty?
      result = "tie"
      break
    end

    turn_id.transform_values!(&:!)

    sleep(1)
    prompt "Here is the updated board"
    display_board(board)
    sleep(1)

  end

  prompt "The game is over. Calculating result... "
  sleep(2)

  if result == "player"
    prompt "Congratulations! You beat the computer! It is not programmed to be very smart though, so big whup"
  elsif result == "computer"
    prompt "Womp womp, you lost to the computer. Better luck next time!"
  else
    prompt "It was a tie. Boring!"
  end

  sleep(2)
  prompt "Here is the final board"
  display_board(board)

  prompt "Would you like to play again? (Yes/no)"
  repeat = gets.chomp.downcase
  break unless repeat.start_with?('y')
  board = reset_board
  prompt "The board has been reset"
  display_board(board)

end

prompt "Thanks for playing! Goodbye!!"