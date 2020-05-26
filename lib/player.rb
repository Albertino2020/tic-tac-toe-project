# rubocop: disable Style/ClassVars
class Player
  attr_reader :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner, :game_over
  attr_writer :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner, :game_over

  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
  end

  def check_input
    @@check_input
  end

  def check_input=(value)
    @@check_input = value
  end

  def board
    @@board
  end

  def board=(value)
    @@board = value
  end

  BOARD_CHECK = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def play
    while @turn
      @choice = gets.to_i
      next unless @@check_input.include?(@choice)

      @@board.record(@symbol, @choice)
      @@check_input.delete(@choice)
      @game_over = BOARD_CHECK.any? { |opt| opt.all? { |match| @@board.current_board[match] == @symbol } }
      display(@@board.current_board)
      if @game_over
        @winner = true
        break
      end
      @@board.count += 1
      @turn = false
    end
  end
end

# rubocop: enable Style/ClassVars
