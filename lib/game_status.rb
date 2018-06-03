# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #down left row
  [1,4,7], #down middle row
  [2,5,8], #down right row
  [0,4,8], #diagnol left to right
  [2,4,6]  #diagnol right to left
]

#defines if there is a winning combination on the board, if draw or board is empty 
def won?(board)
empty_board = board.all? {|index| index == " " || index == ""}
full_board = board.none? { |index| index == " " || index == ""} 
WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? { |index| board[index] == "X" } || win_combo.all? { |index| board[index] == "O" }
     return win_combo
    elsif  empty_board || full_board
      return false
    end
  end
 end

#determines if the board is full
def full?(board)
  !board.any? { |index| index == " "}
end

#determines if there is a draw/nobody win 
def draw?(board)
   if !won?(board) && !full?(board) || won?(board)
    return false
  elsif !won?(board) && full?(board) 
    return true
 
  end
end


  