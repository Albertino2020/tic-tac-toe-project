class Player
  @name = ''
  @symbol = ''
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def play(option)
    $board.record(@symbol, option)
  end

  def check_board()
    $game_over = $board_check.any? { |opt| opt.all? { |match| match == @symbol } }
  end

  def switch_player
    @@played_one, @@played_two = @@played_two, @@played_one
  end
end
