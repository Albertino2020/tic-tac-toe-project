#!/usr/bin/env ruby
require_relative "../lib/board.rb"
require_relative "../lib/player.rb"

puts "Wellcome to the tic-tac-toe geme!"

player_one_name = ""
player_two_name = ""
X = "X".freeze
O = "O".freeze
Y = "Y".freeze
N = "N".freeze

until player_one_name.is_a?(String) && !player_one_name.empty?
  puts "Player One: What is your name?", "\n"
  player_one_name = gets.chomp
end
puts "The Player One name is #{player_one_name}.", "\n"

until player_two_name.is_a?(String) && !player_two_name.empty?
  puts "Player Two: What is your name?", "\n"
  player_two_name = gets.chomp
end
puts "The Player Two name is #{player_two_name}.", "\n"

input_symb1 = ""
until %w[x X o O].include?(input_symb1)
  puts "Please choose X or O", "\n"
  input_symb1 = gets.chomp
end

puts "#{player_one_name} has chosen #{input_symb1} as his game symbol."

input_symb2 = input_symb1.upcase == "O" ? X : O

puts "#{player_two_name} will play with the game symbol #{input_symb2}"

puts ""


