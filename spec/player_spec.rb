require "./lib/board.rb"
require "./lib/player.rb"

describe Player do
  let(:name1) { "name1" }
  let(:symbol1) { "X" }
  let(:player) { Player.new("maria", "X", true) }
  let(:player2) { Player.new("maria", "X", true) }
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  BOARD_CHECK = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  board = Board.new("maria", "joao", "X", "O", true)
  describe "#initialize" do
    it "Initializes as a Player class" do
      expect(player.class).to eql(Player)
    end
    it "initializes instance variables" do
      expect(player.name).to eql("maria")
      expect(player.symbol).to eql("X")
      expect(player.turn).to be true
    end
  end
  describe "#check_input" do
    it "assigns values to the class variable @@check_input" do
      player.check_input = arr
      expect(player.check_input).to eql(arr)
      expect(player.check_input.class).to eql(Array)
    end
  end

  describe "#board" do
    it "assigns values to the class variable @@board" do
      player.board = board
      expect(player.board).to eql(board)
      expect(player.board.class).to eql(Board)
    end
  end

  describe "#play" do
    it "it runs the player's moves and returns nil" do
      expect(player.play).to eql(nil)
    end
  end
end
