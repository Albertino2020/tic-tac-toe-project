require "./lib_clone/board.rb"
require "./lib_clone/player.rb"

RSpec.describe Board do
  let(:pname1) { "name1" }
  let(:pname2) { "name2" }
  let(:symb1) { "X" }
  let(:symb2) { "O" }
  let(:option) { true }
  let(:board) { Board.new(:pname1, :pname2, :symb1, :symb2, :option) }
  let(:current_board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  # rubocop: disable Lint/LiteralAsCondition
  describe "#initialize" do
    it "creates the Board class instance if all required attibutes are passed" do
      expect(board.class).to eql(Board)
      expect(board.current_board).to eql(current_board)
      expect(board.player_one.name).to eql(:pname1)
      expect(board.player_one.symbol).to eql(:symb1)
      expect(board.player_one.turn).to eql(:option)
      expect(board.player_two.name).to eql(:pname2)
      expect(board.player_two.symbol).to eql(:symb2)
      expect(board.player_two.turn).to eql(!:option)
    end
    it "does not create object if required arguments missing" do
      expect { Board.new }.to raise_error(ArgumentError)
      expect { Board.new(:pname1) }.to raise_error(ArgumentError)
      expect { Board.new(:pname1, :symb2, :option) }.to raise_error(ArgumentError)
      expect { Board.new(:symb2, :option) }.to raise_error(ArgumentError)
      expect { Board.new(:pname1, :pname2, :symb1) }.to raise_error(ArgumentError)
      expect { Board.new(:pname1, :symb1, :symb2, :option) }.to raise_error(ArgumentError)
    end
  end
  # rubocop: enable Lint/LiteralAsCondition

  describe "#record" do
    it "records player'/s move on the board if all required arguments given" do
      expect { board.record("X", 2) }.to_not raise_error
      expect(board.record("X", 2)).to eql("X")
      expect(board.current_board).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
      expect(board.current_board[1]).to eql("X")
    end
    it "raises error if arguments missimg " do
      expect { board.record("X") }.to raise_error(ArgumentError)
      expect { board.record(2) }.to raise_error(ArgumentError)
      expect { board.record() }.to raise_error(ArgumentError)
    end
  end

  describe "#next_move" do
    it "starts the next players move" do
      board.player_one.check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.next_move).to eql(board.player_two.play)
      expect(board.player_two.check_input).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(board.player_two.check_input).to eql(board.player_one.check_input)
    end
    it "does not allow a player to take more than one valid move at a time" do
      board.switch(board.player_one)
      expect(board.next_move.equal?(board.player_two.play)).not_to be false
      expect(board.player_two.turn).to_not be false
      expect(board.player_two.name.equal?(board.player_one.name)).to_not be true
    end
  end
  describe "#next_to_play" do
    it "returns the next to play" do
      board.player_two.turn = false
      expect(board.next_to_play).to eql board.player_one
      expect(board.next_to_play).to_not eql board.player_two
    end
  end

  describe "#switch" do
    it "switches players between turns" do
      board.player_one.turn = false
      board.player_two.turn = false
      board.switch(board.player_one)
      expect(board.player_two.turn).to be true
      expect(board.player_one.turn).to be false
     end
    it "it does not change anything if no arguments given" do
      board.player_one.turn = false
      board.player_two.turn = false 
      expect {board.switch()}.to raise_error(ArgumentError)
      expect(board.player_one.turn).to_not be true
      expect(board.player_two.turn).to_not be true
    end
  end
end
