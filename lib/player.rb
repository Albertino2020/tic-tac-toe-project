class Player
  $board_check = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(name, symbol, option)
    @name = name
    @symbol = symbol
    @@turn = option
  end

  def play(move)
    $board.record(@symbol, move)
    played_one = false
    played_two = true
    count = 0
    check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    game_over = false

    while !game_over && !check_input.empty?
      while @turn && count < 9
        puts "#{player_one_name}'s turn Please choose between #{check_input}"
        @choice = gets.to_i
        next unless @@check_input.include?(@choice)
        $board.record(@symbol, @choice)
        @@check_input.delete(@choice)
        i = @choice - 1
        if check_board(i)
          winner(@name)
          break
        end
        count += 1
        @turn = false
      end
    end
  end

  def check_board()
    $game_over = $board_check.any? { |opt| opt.all? { |match| match == @symbol } }
  end

  def switch_player
    @@played_one, @@played_two = @@played_two, @@played_one
  end
end
