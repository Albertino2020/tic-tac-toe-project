# rubocop: disable Style/GlobalVars
class Player
  attr_reader :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner
  attr_writer :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner

  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
  end

  def play
    while @turn
      @choice = gets.to_i
      next unless $check_input.include?(@choice)

      $board.record(@symbol, @choice)
      $check_input.delete(@choice)
      $game_over = $board_check.any? { |opt| opt.all? { |match| $current_board[match] == @symbol } }
      display
      if $game_over
        @winner = true
        break
      end
      $count += 1
      @turn = false
    end
  end
end

# rubocop: enable Style/GlobalVars
