require './lib/board.rb'
require './lib/player.rb'

describe Board do
  let(:pname1) {'name1'}
  let(:pname2) {'name2'}
  let(:symb1) {'X'}
  let(:symb2) {'O'}
  let(:option) {true}
  let(:board) {Board.new(:pname1, :pname2, :symb1, :symb2, :option)}
  let(:current_board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  describe '#initialize' do
    it 'initializes as the board class' do
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
end