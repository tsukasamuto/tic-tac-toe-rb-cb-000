# Helper Method
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left row
  [1, 4, 7], # Middle row
  [2, 5, 8], # Right row
  [0, 4, 8], # Diagonal 1
  [2, 4, 6], # Diagonal 2
]

def display_board(board)
  
end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  count
end


def current_player(board)
  turn_count(board).even? ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[1]] == board[win_combo[2]] &&
      position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? do |token|
  token == "X" || token == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || draw?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

