require "./lib/board.rb"
require "./lib/player.rb"

describe Player do
    let(:name1) { "name1" }
    let(:symbol1) { "X" }
    let(:turn1) { true }
    let(:player) { Player.new(:name1, :symbol1, :turn1) }
    let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  
    describe "#initialize" do
        it "Initializes as a Player class" do
          expect(player.class).to eql(Player)
        end
        it "initializes instance variables" do
          expect(player.name).to eql(:name1)
          expect(player.symbol).to eql(:symbol1)
          expect(player.turn).to eql(:turn1)
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
          player.board = arr
          expect(player.board).to eql(arr)
          expect(player.board.class).to eql(Array)
        end
      end

      describe "#play" do
        context 'player takes a wrong move' do
          it "checks for players turn and executes the players move" do
            player.choice = 0
            player.play
            expect(player.wrong_move).to be true
            expect(player.turn).to be :turn1
            expect(player.check_input.include?(player.choice)).to be false 
          end
        end

      end

end
