COMPUTER_MARKING = 'x'
WIN_COMPUTER = ['x', 'x', 'x']
USER_MARKING = 'o'
WIN_USER = ['o', 'o', 'o'] 

def pick_spot(board_arr, player)
  case player
  when 'computer'
    computer_pick = grab_computer_pick(board_arr)
    puts "Computer chose spot #{computer_pick}"
    update_board(board_arr, computer_pick, player)
  else
    loop do 
      puts "Please pick an empty spot."
      user_pick = gets.chomp
      if valid_choice?(board_arr, user_pick)
        update_board(board_arr, user_pick, player)
        break
      else
        puts 'Invalid choice'
      end
    end
  end
end

def grab_computer_pick(board_arr)
  choices_arr = board_arr.flatten(2) - ['x', 'o']
  pick = rand(board_arr.size)
  choices_arr[pick]
end

def valid_choice?(board_arr, user_pick)
  choices_arr = board_arr.flatten(2) - ['x', 'o']
  choices_arr.include?(user_pick)
end

def update_board(board_arr, pick, player)
  board_arr.each do |row|
    row.each_with_index do |spot, index| 
      if spot == pick
        case player
        when 'computer'
          row[index] = COMPUTER_MARKING
        else
          row[index] = USER_MARKING
        end
        break
      end
    end
  end
end

def display_board(board_arr)
  system 'clear'
  puts ''
  board_arr.each {|row| puts "|#{row[0]}|#{row[1]}|#{row[2]}|"}
end

def row(board_arr)
  board_arr.map do |row|
    row 
  end
end

def cross(board_arr)
  cross = []

  cross << board_arr.map.with_index do |row, index|
    row[index]
  end

  cross << board_arr.reverse.map.with_index do |row, index|
    row[index]
  end  
end

def vertical(board_arr)
end

def win?(board_arr)
  row_win?(board_arr) || cross_win?(board_arr) || vertical_win?(board_arr)
end

def row_win?(board_arr)
  row(board_arr).each do |row|
    return true if row == WIN_COMPUTER || row == WIN_USER 
  end
  false
end

def cross_win?(board_arr)
   cross = board_arr.map.with_index do |row, index|
    row[index]
  end
  return true if cross == WIN_COMPUTER || cross == WIN_USER

  reverse_cross = board_arr.reverse.map.with_index do |row, index|
    row[index]
  end
  return true if reverse_cross == WIN_COMPUTER || reverse_cross == WIN_USER
  false
end

def vertical_win?(board_arr)
  index = 0
  loop do
    vertical = board_arr.map do |row|
      row[index]
    end
    return true if vertical == WIN_COMPUTER || vertical == WIN_USER
    index += 1
    break if index == (board_arr.size - 1)
  end
  false
end

def display_outcome(winner = 'draw')
  if winner == 'draw'
    puts 'It\'s a draw'
  else
    puts "The winner is #{winner}"
  end
end

def play_again?
  loop do
    puts 'Play again?'
    answer = gets.chomp.downcase
    if ['yes', 'y'].include?(answer)
      return true
    elsif ['no', 'n'].include?(answer)
      return false
    else
      puts 'Invalide input. Please try again.'
    end
  end
end

def switch_player(player)
  player == 'computer' ? 'me' : 'computer'
end

# main
puts 'Hello, let\'s play tic, tac, toe.'
puts 'What\'s your name?'
name = gets.chomp().capitalize

board_arr = [%w(1 2 3), %w(4 5 6), %w(7 8 9)]

# display_board(board_arr)

loop do
  first_player = ''

  loop do
    puts "Who should go first? you(input: me) or the computer?"  
    first_player = gets.chomp.downcase
    if ['you', name, 'me', 'computer'].include?(first_player)
      break
    else
      puts 'Invalid input'
    end
  end

  player = first_player
  winner = ''
  
  display_board(board_arr) unless player == 'computer'

  board_arr.flatten(2).size.times do |_|
    pick_spot(board_arr, player)
    display_board(board_arr)

    if win?(board_arr)
      case player
      when 'computer'
        winner = 'computer'
      else
        winner = name
      end
      break
    end

    player = switch_player(player)
  end
  
  display_outcome(winner)

  if play_again?
    board_arr = [%w(1 2 3), %w(4 5 6), %w(7 8 9)]
  else
    break
  end
end

puts "Goodbye #{name}"
