#!/usr/bin/env ruby
puts "Wellcome to the tic-tac-toe geme!"
# display_instruction()
# Identify players:
player_one_name = ""
player_two_name = ""
until player_one_name.is_a?(String) && !player_one_name.empty?
  puts "Player One: What is your name?"
  player_one_name = gets.chomp
end
puts "The Player One name is #{player_one_name}."

until player_two_name.is_a?(String) && !player_two_name.empty?
  puts "Player Two: What is your name?"
  player_two_name = gets.chomp
end
puts "The Player Two name is #{player_two_name}."
# Read player's option and set up game symbol
input_symb1 = ""
until %w[x X o O].include?(input_symb1)
  puts "Please choose X or O"
  input_symb1 = gets.chomp # Read player option.
end
puts "#{player_one_name} has chosen #{input_symb1} as his game symbol."
input_symb2 = input_symb1.upcase == "O" ? "X" : "O"
puts "#{player_two_name} will play with the game symbol #{input_symb2}"
puts ""
# Create player's class instances
# Initialize game class
# Initialize Game Board
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# Display Current Board
puts "Current Board:", "\n"
print board[0], "  |  ", board[1], "  |  ", board[2], "\n"
print "\n"
print board[3], "  |  ", board[4], "  |  ", board[5], "\n"
print "\n"
print board[6], "  |  ", board[7], "  |  ", board[8], "\n"
print "\n"
# Initialize Control Variables
played_one = false
played_two = true
count = 0
check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game_over = false