require './lib_clone/board.rb'
require './lib_clone/player.rb'

RSpec.describe Board do
  let(:pname1) { 'name1' }
  let(:pname2) { 'name2' }
  let(:symb1) { 'X' }
  let(:symb2) { 'O' }
  let(:option) { true }
  let(:board) { Board.new(:pname1, :pname2, :symb1, :symb2, :option) }
  let(:current_board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  # rubocop: disable Lint/LiteralAsCondition
  describe '#initialize' do
    it 'creates the Board class instance if all required attibutes are passed' do
      expect(board.class).to eql(Board)
      expect(board.current_board).to eql(current_board)
      expect(board.player_one.name).to eql(:pname1)
      expect(board.player_one.symbol).to eql(:symb1)
      expect(board.player_one.turn).to eql(:option)
      expect(board.player_two.name).to eql(:pname2)
      expect(board.player_two.symbol).to eql(:symb2)
      expect(board.player_two.turn).to eql(!:option)
    end
  end
  # rubocop: enable Lint/LiteralAsCondition

  describe '#record' do
    it "records player'/s move on the board if all required arguments given" do
      expect {board.record('X', 2)}.to_not raise_error
      expect(board.record('X', 2)).to eql('X')
      expect(board.current_board).to eql([1, 'X', 3, 4, 5, 6, 7, 8, 9])
      expect(board.current_board[1]).to eql('X')
    end
    it 'raises error if arguments missimg ' do
      expect {board.record('X')}.to raise_error(ArgumentError)
      expect {board.record(2)}.to raise_error(ArgumentError)
      expect {board.record()}.to raise_error(ArgumentError)
    end
  end

  describe '#next_move' do
    it 'starts the next players move' do
      board.player_one.check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.next_move).to eql(board.player_two.play)
    end
  end
  describe '#next_to_play' do
    it 'returns the next to play' do
      board.player_one.check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      board.player_two.check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.next_to_play).to eql board.player_one
    end
  end

  describe '#switch' do
    it 'switches players between turns' do
      board.switch(board.player_one)
      expect(board.player_two.turn).to be true
    end
  end
end
