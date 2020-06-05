# rubocop: disable Metrics/BlockNesting
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
puts 'Wellcome to the tic-tac-toe game!'
player_one_name = ''
player_two_name = ''
X = 'X'.freeze
O = 'O'.freeze
Y = 'Y'.freeze
N = 'N'.freeze

def display(board)
  print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
  print "\n"
  print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
  print "\n"
  print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
  print "\n"
end

until player_one_name.is_a?(String) && !player_one_name.empty?
  puts 'Player One: What is your name?', "\n"
  player_one_name = gets.chomp
end
puts "The Player One name is #{player_one_name}.", "\n"

until player_two_name.is_a?(String) && !player_two_name.empty?
  puts 'Player Two: What is your name?', "\n"
  player_two_name = gets.chomp
end
puts "The Player Two name is #{player_two_name}.", "\n"

input_symb1 = ''
until %w[x X o O].include?(input_symb1)
  puts 'Please choose X or O', "\n"
  input_symb1 = gets.chomp
end

puts "#{player_one_name} has chosen #{input_symb1} as his game symbol."

input_symb2 = input_symb1.upcase == 'O' ? X : O

puts "#{player_two_name} will play with the game symbol #{input_symb2}"

puts ''

play_again = true
while play_again
  first_to_play = ''
  until [player_one_name, player_two_name].include?(first_to_play)
    puts 'Who will start playing?', "\n"
    first_to_play = gets.chomp
    option = player_one_name == first_to_play
    player = option ? Player.new(player_one_name, input_symb1, true) : Player.new(player_two_name, input_symb2, true)
    player.check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  player.board = Board.new(player_one_name, player_two_name, input_symb1, input_symb2, option)

  puts 'Current Board:', "\n"
  display(player.board.current_board)
  player.board.count = 0
  player.game_over = false
  while player.board.count < 9
    player = player.board.next_to_play
    player.wrong_move = false
    while player.turn && !player.check_input.empty?
      puts "#{player.name}'s turn: Please choose between #{player.check_input}", "\n"
      player.board.next_move
      puts 'Oh Oh! Wrong move!! Please try again!', "\n" if player.wrong_move
      break if player.game_over
    end
    break if player.game_over || player.check_input.empty?

    player.board.switch(player)
  end
  if player.game_over
    puts "Game over!! Congratulations, #{player.name}, you won!!", "\n"
  else
    puts 'Match Drawn!!', "\n"
  end

  puts 'Current Board:', "\n"
  display(player.board.current_board)

  puts 'Play again?', "\n"
  answer = ''
  until %w[y Y n N].include?(answer)
    puts 'Please choose Y/N (yes/no)', "\n"
    answer = gets.chomp
  end
  play_again = answer.upcase == Y
end
# rubocop: enable Metrics/BlockNesting
