require_relative '../lib/board.rb'

def display(board)
  print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
  print "\n"
  print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
  print "\n"
  print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
  print "\n"
end
