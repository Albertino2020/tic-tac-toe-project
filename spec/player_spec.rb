require './lib_clone/board.rb'
require './lib_clone/player.rb'

describe Player do
  let(:name1) { 'name1' }
  let(:symbol1) { 'X' }
  let(:player) { Player.new('maria', 'X', true) }
  let(:player2) { Player.new('maria', 'X', true) }
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  BOARD_CHECK = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  board = Board.new('maria', 'joao', 'X', 'O', true)
  describe '#initialize' do
    it 'Initializes as a Player class' do
      expect { Player.new('maria', 'X', true) }.to_not raise_error
      expect(player.class).to eql(Player)
    end
    it 'initializes instance variables' do
      expect(player.name).to eql('maria')
      expect(player.symbol).to eql('X')
      expect(player.turn).to be true
    end
    it 'does not create objec if required arguments missing' do
      expect { Player.new }.to raise_error(ArgumentError)
      expect { Player.new(:pname1) }.to raise_error(ArgumentError)
      expect { Player.new(:pname1, :symb2) }.to raise_error(ArgumentError)
      expect { Player.new(:symb2, :option) }.to raise_error(ArgumentError)
    end
  end
  describe '#check_input' do
    it 'assigns values to the class variable @@check_input' do
      player.check_input = arr
      expect(player.check_input).to eql(arr)
      expect(player.check_input.class).to eql(Array)
    end
  end

  describe '#board' do
    it 'assigns values to the class variable @@board' do
      player.board = board
      expect(player.board).to eql(board)
      expect(player.board.class).to eql(Board)
    end
  end

  describe '#play' do
    it "it runs the player's moves and returns nil" do
      expect(player.play).to eql(nil)
    end
    context 'player takes a wrong move' do
      it 'it validates the players move' do
        player.board = board
        player.choice = 0
        player.play
        expect(player.wrong_move).to be true
      end

      it 'checks for players input and breaks' do
        player.board = board
        player.choice = 0
        player.play
        expect(player.board.current_board).to eql(arr)
      end
      it "doesn't change the player's turn" do
        player.board = board
        player.choice = 0
        player.play
        expect(player.turn).to be true
      end
      it "doesn't update the game status" do
        player.board = board
        player.choice = 0
        player.play
        expect(player.game_over).to be false
      end
      it "checks and validates the player's move" do
        player.board = board
        player.choice = 0
        player.play
        expect(player.check_input.include?(player.choice)).to be false
      end
    end
    context 'player takes a valid move' do
      it 'validates the players move' do
        player.board = board
        player.choice = 3
        player.play
        expect(player.wrong_move).to be nil
      end

      it "checks for player's turn and records the players move on the #current_board" do
        player.board = board
        player.choice = 3
        player.board.count = 0
        player.play
        expect(player.board.current_board).to eql([1, 2, 'X', 4, 5, 6, 7, 8, 9])
      end
      it "it updates the list of valid input by removing the player's move from the #check_input" do
        player.board = board
        player.choice = 3
        player.board.count = 0
        player.play
        expect(player.check_input.include?(player.choice)).to be false
      end
    end
    describe '#game_over' do
      it 'returns false if the players move is not a winning one' do
        player.board = board
        player.choice = 3
        player.board.count = 0
        player.play
        expect(player.game_over).to be false
      end
      it 'returns true if player takes a winning move' do
        player.board = board
        player.board.current_board = [1, 'X', 'X', 4, 5, 6, 7, 8, 9]
        player.choice = 1
        player.board.count = 0
        player.play
        expect(player.game_over).to be true
      end
    end
    # rubocop: disable Metrics/BlockLength
    context "doesn't allow unexpected behavior" do
      it 'does not reject valid moves' do
        player.board = board
        player.choice = 6
        player.play
        expect(player.wrong_move).to_not be true
      end
      it "does not record mismatched player's symbol" do
        player.board = board
        player.choice = 6
        player.play
        expect(player.board.current_board[5]).to_not eql('O')
        expect(player.board.current_board[5]).to eql('X')
      end
      it "does not record player's moves into wrong position on the board" do
        player.board = board
        player.choice = 4
        player.play
        expect(player.board.current_board[4]).to_not eql('X')
        expect(player.board.current_board[3]).to eql('X')
      end

      it 'does not validate wrong moves' do
        player.board = board
        player.board.current_board = arr
        player.choice = 11
        player.play
        expect(player.wrong_move).to_not be false
        expect(player.board.current_board).to eql(arr)
      end
      it "doesn't expect player's turn to be true after taking a valid move." do
        player.board = board
        player.choice = 8
        player.play
        expect(player.turn).to_not be true
      end
      it "doesn't expect game_over to be true after a winning move" do
        player.board = Board.new('maria', 'joao', 'X', 'O', true)
        player.turn = true
        player.board.current_board = [1, 2, 'O', 'X', 'X', 'X', 'O', 8, 'O']
        player.play
        expect(player.game_over).to_not be false
      end
      it "doesn't allow a previous valid move to be avaible as an option after player's move" do
        player.board = board
        player.choice = 1
        player.play
        expect(player.check_input.include?(player.choice)).to_not be true
      end
    end
  end
  # rubocop: enable Metrics/BlockLength
end
