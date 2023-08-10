require 'pry'

# method definitions
def welcome_message
  puts "Welcome, #{NAME}! Let's play rock, paper, scissors, lizard, spock!"
end

def grab_name
  loop do
    puts 'Please enter your name'
    name = gets.chomp.strip.capitalize
    if name == ''
      puts 'You forgot to enter a name.'
    else
      return name
    end
  end
end

def grab_user_choice
  loop do
    puts <<~CHOICE_PROMPT
            Please enter your choice:
            - rock or r
            - paper or p
            - scissors or sc
            - lizard or l
            - spock or sp
          CHOICE_PROMPT
    user_choice = gets.chomp.strip.downcase
    if choice_valid?(user_choice)
      return grab_full_choice_name(user_choice)
    else
      puts 'invalid input'
    end
  end
end

def grab_full_choice_name(user_choice)
  INPUT_TYPES.each do |key, choice_variations|
    choice_variations.each do |choice_variation|
      return key.to_s if choice_variation == user_choice
    end
  end
end

def choice_valid?(user_choice)
  if user_choice == ''
    print "You did not enter anything! It's an "
  end
  INPUT_TYPES.each do |_key, values|
    return true if values.include?(user_choice)
  end
  false
end

def grab_computer_choice
  random_type_index = rand(INPUT_TYPES.size)
  INPUT_TYPES.keys[random_type_index].to_s
end

def user_win_result(user_choice, computer_choice)
  if user_choice == computer_choice
    'draw'
  elsif LOSES_AGAINST[user_choice.to_sym].include?(computer_choice)
    'no'
  else
    'yes'
  end
end

def track_wins(user_win_result, num_user_wins, num_computer_wins)
  if user_win_result == 'yes'
    num_user_wins += 1
  elsif user_win_result == 'no'
    num_computer_wins += 1
  end
  return num_user_wins, num_computer_wins
end

def output_round_results(user_win_result, user_choice, computer_choice)
  if user_win_result == 'yes'
    puts "#{user_choice} beats #{computer_choice}. #{NAME}, you win this round."
  elsif user_win_result == 'draw'
    puts "I chose #{computer_choice} also, so it's a draw. Redo the round."
  else
    puts <<~USER_LOST_MSG
    #{user_choice} loses to #{computer_choice}.
    #{NAME}, you lost this round. Lol"
    USER_LOST_MSG
  end
end

def output_grand_winner(num_user_wins, num_computer_wins)
  if num_user_wins > num_computer_wins
    puts "#{NAME}, you are the grand winner :{"
  else
    puts 'Sorry it looks like I\'m the grand winner. Too bad :)'
  end
end

def play_again?
  loop do
    puts 'Do you want to play again?'
    answer = gets.chomp.strip.downcase
    if ['yes', 'y'].include?(answer)
      return true
    elsif ['no', 'n'].include?(answer)
      return false
    else
      puts "That's an invalid answer."
    end
  end
end

def output_total_wins(num_user_wins, num_computer_wins)
  puts "#{NAME}, you have #{num_user_wins} wins."
  puts "I have #{num_computer_wins} wins"
end

# main
INPUT_TYPES = { rock: ['rock', 'r'],
                paper: ['paper', 'p'],
                scissors: ['scissors', 'sc'],
                lizard: ['lizard', 'l'],
                spock: ['spock', 'sp'] }

LOSES_AGAINST = { rock: ['paper', 'spock'],
                  paper: ['scissors', 'lizard'],
                  scissors: ['rock', 'spock'],
                  lizard: ['rock', 'scissors'],
                  spock: ['lizard', 'paper'] }
NAME = grab_name

welcome_message

loop do
  num_user_wins = 0
  num_computer_wins = 0

  while (num_user_wins < 2) && (num_computer_wins < 2)
    user_choice = grab_user_choice
    computer_choice = grab_computer_choice
    result = user_win_result(user_choice, computer_choice)
    output_round_results(result, user_choice, computer_choice)
    num_user_wins, num_computer_wins = track_wins(result,
                                                  num_user_wins,
                                                  num_computer_wins)
    output_total_wins(num_user_wins, num_computer_wins)
  end

  output_grand_winner(num_user_wins, num_computer_wins)

  if play_again?
    puts "Let's go again! Yay."
  else
    puts "See you later ~"
    break
  end
end
