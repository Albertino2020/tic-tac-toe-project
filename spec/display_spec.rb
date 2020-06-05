require './bin_clone/display.rb'

describe '#display' do
  it 'draws the board on the screen' do
    current_board = [1, 'X', 'O', 'O', 5, 'X', 6, 8, 9]
    expect(display(current_board)).to be nil
  end
end
