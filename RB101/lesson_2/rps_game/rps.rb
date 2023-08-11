# method definitions
def prompt(str)
  puts "=> #{str}\n"
end

def welcome_message
  prompt("Welcome, #{NAME}! Let's play rock, paper, scissors, lizard, spock!\n")
end

def grab_name
  loop do
    prompt('Please enter your name')
    name = gets.chomp.strip.capitalize
    if name == ''
      prompt("You forgot to enter a name.\n")
    else
      return name
    end
  end
end

def grab_choices
  choices_string = ''
  INPUT_TYPES.each do |_key, choice_variations|
    choices_string += "- #{choice_variations.join(' or ')}\n"
  end
  choices_string
end

def grab_user_choice
  loop do
    puts <<~CHOICE_PROMPT
    Please enter your choice:
    #{grab_choices}
    Your choice:  
    CHOICE_PROMPT
    user_choice = gets.chomp.strip.downcase
    if choice_valid?(user_choice)
      return grab_full_choice_name(user_choice)
    elsif user_choice == ''
      prompt("You did not enter anything!\n")
    else
      prompt('invalid input')
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

def output_round_result(result, user_choice, computer_choice)
  if result == 'yes'
    prompt(<<~OUTPUT
    #{user_choice} beats #{computer_choice}. #{NAME}, you win this round."
    OUTPUT
          )
  elsif result == 'draw'
    prompt("I chose #{computer_choice} also, so it's a draw. Redo the round.")
  else
    prompt(<<~OUTPUT
    #{user_choice} loses to #{computer_choice}.
    #{NAME}, you lost this round. Lol"
    OUTPUT
          )
  end
end

def output_grand_winner(num_user_wins, num_computer_wins)
  if num_user_wins > num_computer_wins
    prompt("#{NAME}, you are the grand winner :{")
  else
    prompt('Sorry it looks like I\'m the grand winner. Too bad :)')
  end
end

def play_again?
  loop do
    prompt('Do you want to play again?')
    answer = gets.chomp.strip.downcase
    if ['yes', 'y'].include?(answer)
      prompt("Let's go again! Yay.")
      return true
    elsif ['no', 'n'].include?(answer)
      prompt("See you later ~")
      return false
    else
      prompt("That's an invalid answer.")
    end
  end
end

def output_total_wins(num_user_wins, num_computer_wins)
  prompt("#{NAME}, you have #{num_user_wins} wins.")
  prompt("I have #{num_computer_wins} wins\n")
end

def play_game
  num_user_wins = 0
  num_computer_wins = 0

  while (num_user_wins < 2) && (num_computer_wins < 2)
    user_choice = grab_user_choice
    computer_choice = grab_computer_choice
    result = user_win_result(user_choice, computer_choice)
    output_round_result(result, user_choice, computer_choice)
    num_user_wins, num_computer_wins = track_wins(result,
                                                  num_user_wins,
                                                  num_computer_wins)
    output_total_wins(num_user_wins, num_computer_wins)
  end
  return num_user_wins, num_computer_wins
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
  num_user_wins, num_computer_wins = play_game
  output_grand_winner(num_user_wins, num_computer_wins)
  break unless play_again?
end
