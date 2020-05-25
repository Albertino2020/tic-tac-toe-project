#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
# rubocop: disable Style/GlobalVars
puts 'Wellcome to the tic-tac-toe geme!'

player_one_name = ''
player_two_name = ''
X = 'X'.freeze
O = 'O'.freeze
Y = 'Y'.freeze
N = 'N'.freeze

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
  end

  $board = Board.new(player_one_name, player_two_name, input_symb1, input_symb2, option)
  $current_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  $check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  $board_check = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  $game_over = false
  $count = 0

  puts 'Current Board:', "\n"

  $board.display
  while $count < 9
    player = $board.next_move

    break if $game_over || $check_input.empty?

    $board.switch(player)
  end
  if $game_over
    puts "Game over!! Congratulations, #{$board.winner.name}, you won!!", "\n"
  else
    puts 'Match Drawn!!', "\n"
  end

  puts 'Current Board:', "\n"
  $board.display

  puts 'Play again?', "\n"
  answer = ''
  until %w[y Y n N].include?(answer)
    puts 'Please choose Y/N (yes/no)', "\n"
    answer = gets.chomp
  end
  play_again = answer.upcase == Y
end
# rubocop: enable Style/GlobalVars
