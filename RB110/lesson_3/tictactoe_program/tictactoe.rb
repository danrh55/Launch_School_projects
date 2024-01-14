require 'pry'

# constants
COMPUTER_MARKING = 'x'
USER_MARKING = 'o'

# methods
def initalize_board
  [%w(1 2 3), %w(4 5 6), %w(7 8 9)]
end

def display_board(board_arr)
  puts ''
  board_arr.each { |row| puts "|#{row[0]}|#{row[1]}|#{row[2]}|" }
  puts ''
end

def first_player(user_name)
  loop do
    puts "Who should go first this round (Computer or #{user_name})?"
    choice = gets.chomp.capitalize
    return choice if ['Computer', user_name].include?(choice)
    puts 'Invalid input. Please try again.'
  end
end

def pick_spot(board_arr, current_player)
  case current_player
  when 'Computer'
    grab_computer_pick(board_arr)
  else
    grab_user_pick(board_arr)
  end
end

def update_board(board_arr, pick, current_player)
  board_arr.each do |row|
    row.each_with_index do |spot, index|
      if spot == pick
        case current_player
        when 'Computer'
          row[index] = COMPUTER_MARKING
        else
          row[index] = USER_MARKING
        end
        break
      end
    end
  end
end

def grab_computer_pick(board_arr)
  attack_spot = vulnerable_spot(board_arr, COMPUTER_MARKING)
  unless attack_spot.nil?
    puts "Computer attacks by choosing spot #{attack_spot}"
    return attack_spot
  end

  defend_spot = vulnerable_spot(board_arr, USER_MARKING)
  unless defend_spot.nil?
    puts "Computer defends by choosing spot #{defend_spot}"
    return defend_spot
  end

  spot = spot_options(board_arr).sample
  puts "Computer chooses spot #{spot}"
  spot
end

def vulnerable_spot(board_arr, marking)
  ways_to_match = [rows(board_arr), columns(board_arr), diagonals(board_arr)]
  for win_arrays in ways_to_match
    win_arrays.each do |arr|
      if arr.count(marking) == 2
        arr.each { |spot| return spot if spot =~ /[^xo]/ }
      end
    end
  end
  nil
end

def game_won?(board_arr)
  ways_to_match = [rows(board_arr), columns(board_arr), diagonals(board_arr)]
  for win_arrays in ways_to_match
    win_arrays.each do |arr|
      return true if arr.count('x') == 3 || arr.count('o') == 3
    end
  end
  false
end

# for readability purpose
def rows(board_arr)
  board_arr
end

def columns(board_arr)
  columns_arr = []
  column_index = 0

  loop do
    column = board_arr.map do |row|
      row[column_index]
    end

    columns_arr << column
    column_index += 1
    break if columns_arr.size == board_arr.size
  end
  columns_arr
end

def diagonals(board_arr)
  diagonals_arr = []

  diagonal = board_arr.map.with_index do |row, row_index|
    row[row_index]
  end

  diagonals_arr << diagonal

  other_diagonal = board_arr.map.with_index do |row, row_index|
    row.reverse[row_index]
  end

  diagonals_arr << other_diagonal
end

def spot_options(board_arr)
  board_arr.flatten(2) - ['x', 'o']
end

def board_full?(board_arr)
  spot_options(board_arr).size <= 1
end

def grab_user_pick(board_arr)
  loop do
    puts "Please pick an empty spot."
    user_pick = gets.chomp
    return user_pick if spot_options(board_arr).include?(user_pick)
    puts 'Invalid option. Please try again.'
  end
end

def alternate_player(current_player, user_name)
  current_player == 'Computer' ? user_name : 'Computer'
end

def play_again?
  answer = ''

  loop do
    puts 'Do you want to play again? (y/n)'
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
  end
  answer == 'y'
end

# main
puts 'Let\'s play tic, tac, toe!'
puts 'What\'s your name?'
user_name = gets.chomp.capitalize

puts 'Let\'s start playing. The first player to 5 wins, wins the battle.'

loop do
  computer_win_count = 0
  user_win_count = 0

  loop do
    board_arr = initalize_board
    current_player = first_player(user_name)
    system 'clear'
    display_board(board_arr)
    system 'clear' if current_player == 'Computer'

    loop do
      pick = pick_spot(board_arr, current_player)
      update_board(board_arr, pick, current_player)
      system 'clear' if current_player == user_name
      puts "The result is:"
      display_board(board_arr)

      if game_won?(board_arr)
        # last player to pick won the game.
        puts "#{current_player} won this round."
        case current_player
        when 'Computer'
          computer_win_count += 1
        else
          user_win_count += 1
        end
        break
      elsif board_full?(board_arr)
        puts 'It\'s a draw this round.'
        break
      end
      current_player = alternate_player(current_player, user_name)
    end
    puts ''
    puts "You have #{user_win_count} wins."
    puts "While the computer has #{computer_win_count} wins."
    puts ''
    puts 'Next round!'
    puts ''

    if computer_win_count == 5
      puts 'Computer has won the battle!'
    elsif user_win_count == 5
      puts "#{user_name} has won the battle!"
    end
  end
  break unless play_again?
end
