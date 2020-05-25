class Player
  attr_accessor :name, :symbol, :turn, :turn_one, :turn_two, :choice, :winner

  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
  end

end
