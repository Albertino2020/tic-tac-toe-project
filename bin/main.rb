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