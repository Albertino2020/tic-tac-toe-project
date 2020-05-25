class Board
  def initialize()
    $current_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def record(symbol, option)
    $current_board[option - 1] = symbol
  end

  def display
    print $current_board[0], "  |  ", $current_board[1], "  |  ", $current_board[2], "\n"
    print "\n"
    print $current_board[3], "  |  ", $current_board[4], "  |  ", $current_board[5], "\n"
    print "\n"
    print $current_board[6], "  |  ", $current_board[7], "  |  ", $current_board[8], "\n"
    print "\n"
  end
end
