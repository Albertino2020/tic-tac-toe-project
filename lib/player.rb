class Player
  attr_accessor :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner

  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
  end

  def play
    while @turn
      puts "#{@name}'s turn: Please choose between #{$check_input}", "\n"
      @choice = gets.to_i
      next unless $check_input.include?(@choice)
      $board.record(@symbol, @choice)
      $check_input.delete(@choice)
      $game_over = $board_check.any? { |opt| opt.all? { |match| $current_board[match] == @symbol } }
      $board.display
      print $game_over
      if $game_over
        @winner = true
        break
      end
      $count += 1
      @turn = false
    end
  end
end
