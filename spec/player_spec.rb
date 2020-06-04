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

end
