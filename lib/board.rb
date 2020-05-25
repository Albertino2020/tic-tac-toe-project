class Board
  attr_accessor :player_one, :player_two
  def initialize(_name1, name2, symb1, symb2, option)
    @player_one = Player.new(_name1, symb1, option)
    @player_two = Player.new(name2, symb2, !option)
  end

  def record(symbol, choice)
    $current_board[choice - 1] = symbol
  end

  def next_move
    if @player_one.turn
      @player_one.play
      return player_one
    else
      @player_two.play
      return player_two
    end
  end

  def switch(player)
    if player == player_one
      player_two.turn = true
    else
      player_one.turn = true
    end
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
