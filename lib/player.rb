# rubocop: disable Style/ClassVars
class Player
  attr_reader :name, :symbol, :turn, :choice,:game_over, :wrong_move
  attr_writer :name, :symbol, :turn, :choice,:game_over, :wrong_move

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
      if !@@check_input.include?(@choice)
        @wrong_move = true
        break
      end
      @@board.record(@symbol, @choice)
      @@check_input.delete(@choice)
      @game_over = BOARD_CHECK.any? { |opt| opt.all? { |match| @@board.current_board[match] == @symbol } }
      display(@@board.current_board)
      @@board.count += 1
      @turn = false
    end
  end
end

# rubocop: enable Style/ClassVars
