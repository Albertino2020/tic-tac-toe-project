# rubocop: disable Style/GlobalVars
class Board
  attr_reader :player_one, :player_two
  attr_writer :player_one, :player_two

  def initialize(pname1, pname2, symb1, symb2, option)
    @player_one = Player.new(pname1, symb1, option)
    @player_two = Player.new(pname2, symb2, !option)
  end

  def record(symbol, choice)
    $current_board[choice - 1] = symbol
  end

  def next_move
    if @player_one.turn
      @player_one.play
      @player_one
    else
      @player_two.play
      @player_two
    end
  end

  def switch(player)
    if player == player_one
      @player_two.turn = true
    else
      @player_one.turn = true
    end
  end

  def winner
    if @player_one.winner
      @player_one
    elsif @player_two.winner
      @player_two
    end
  end
end

# rubocop: enable Style/GlobalVars
