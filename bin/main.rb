#!/usr/bin/env ruby
puts 'Wellcome to the tic-tac-toe geme!'
# display_instruction()
# Identify players:
player_one_name = ''
player_two_name = ''
until player_one_name.is_a?(String) && !player_one_name.empty?
  puts 'Player One: What is your name?'
  player_one_name = gets.chomp
end
puts "The Player One name is #{player_one_name}."

until player_two_name.is_a?(String) && !player_two_name.empty?
  puts 'Player Two: What is your name?'
  player_two_name = gets.chomp
end
puts "The Player Two name is #{player_two_name}."
# Read player's option and set up game symbol
input_symb1 = ''
until %w[x X o O].include?(input_symb1)
  puts 'Please choose X or O'
  input_symb1 = gets.chomp # Read player option.
end
puts "#{player_one_name} has chosen #{input_symb1} as his game symbol."
input_symb2 = input_symb1.upcase == 'O' ? 'X' : 'O'
puts "#{player_two_name} will play with the game symbol #{input_symb2}"
puts ''
# Create player's class instances
# Initialize game class
# Initialize Game Board
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# Display Current Board
puts 'Current Board:', "\n"
print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
print "\n"
print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
print "\n"
print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
print "\n"
# Initialize Control Variables
played_one = false
played_two = true
count = 0
check_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game_over = false
# Read players' optionn from the keyboard,
# Validate input,
# Update Game Board,
# Display Current Board
# Update Control Variables

while !game_over && count < 9 && !check_input.empty?
  # unless check_input.empty?
  while !played_one && played_two && count < 9
    puts "#{player_one_name}'s turn Please choose between #{check_input} count: #{count}"
    player_one_choice = gets.to_i # Read player option from the user
    next unless check_input.include?(player_one_choice)

    board[player_one_choice - 1] = input_symb1 # unless !check_input.include?(player_one)
    check_input.delete(player_one_choice)
    # display_board(current_board)
    puts 'Current Board:', "\n"
    print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
    print "\n"
    print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
    print "\n"
    print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
    print "\n"
    i = player_one_choice - 1
    game_over = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].any? do |a|
      a.include?(i) && a.all? { |x| board[x] == board[i] }
    end
    if game_over
      puts "Game over !! Congratulation #{player_one_name}, you are the winner", "\n"
      break
    end

    count += 1
    played_one = true
    played_two = false
  end

  while !played_two && played_one && count < 9
    puts "#{player_two_name}'s turn Please choose between #{check_input} count: #{count}"
    player_two_choice = gets.to_i # Read player option from the user
    next unless check_input.include?(player_two_choice) # Checks input, validate or reject invalid input

    board[player_two_choice - 1] = input_symb2 # unless !check_input.include?(player_one)
    check_input.delete(player_two_choice)
    # display_board(current_board)
    puts 'Current Board:', "\n"
    print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
    print "\n"
    print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
    print "\n"
    print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
    print "\n"
    i = player_two_choice - 1
    game_over = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].any? do |a|
      a.include?(i) && a.all? { |x| board[x] == board[i] }
    end
    if game_over
      puts "Game over !! Congratulation #{player_two_name}, you are the winner", "\n"
      break
    end
    count += 1
    played_one = false
    played_two = true
  end
end
puts 'Match Drawn!!', "\n" unless game_over

# puts "Congratulation #{player_two_name}, you are the winner" if game_over
# display_board(current_board)
puts 'Recorded Moves:', "\n"
print board[0], '  |  ', board[1], '  |  ', board[2], "\n"
print "\n"
print board[3], '  |  ', board[4], '  |  ', board[5], "\n"
print "\n"
print board[6], '  |  ', board[7], '  |  ', board[8], "\n"
print "\n"
# display_results()
# winner()
