require './player'

class RPSGame
  attr_reader :human, :computer, :total_rounds, :tied_hand
  attr_accessor :round

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 1
  end

  def play
    set_num_rounds

    total_rounds.times do
      # Repeat if its a tie.
      loop do
        pick_hands
        winner = determine_winner
        process_winner(winner)
        break unless winner == 'tie'
      end
    end
    display_overall_winner(determine_overall_winner)
  end

  def play_again?
    sleep 3
    system 'clear'
    answer = ''

    loop do
      puts "\nDo you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(yes y no n).include?(answer)
      puts "Invalid input. Please input y or n."
    end
    %w(yes y).include?(answer)
  end

  def welcome
    puts "#{human.name} let's play rock, paper, scissors, lizard, spock."
  end

  def reset
    self.round = 1
    human.reset
    computer.reset
  end

  private

  def process_winner(winner)
    display_result(winner)
    update_scores(winner)
  end

  def set_num_rounds
    answer = nil

    loop do
      puts "How many rounds do you want to play?"
      answer = gets.chomp
      break if valid_num_rounds?(answer)
    end
    @total_rounds = answer.to_i
    system 'clear'
  end

  def valid_num_rounds?(answer)
    if answer == '0'
      # returns a falsy value
      puts "You must play at least one round.\n\n"
    elsif answer =~ /[^\d]/ || answer.strip == ''
      # returns a falsy value
      puts "Invalid input. Please try again.\n\n"
    else
      true
    end
  end

  def pick_hands
    sleep 1 unless round == 1
    system 'clear'
    puts "Round: #{round}"
    human.pick
    computer.pick
    self.round += 1
  end

  def determine_winner
    if human.hand > computer.hand
      human.name
    elsif computer.hand > human.hand
      computer.name
    else
      'tie'
    end
  end

  def display_result(winner)
    tied_hand = human.hand

    case winner
    when 'tie'
      puts "\nYou both chose #{tied_hand}."
      puts 'It\'s a tie. Let\'s repeat the round.'
    else
      puts "\n#{human.name} chose #{human.hand}."
      puts "#{computer.name} chose #{computer.hand}.\n\n"
      puts "=> #{winner} is the winner of this round."
    end
  end

  def update_scores(winner)
    case winner
    when human.name
      human.score += 1
    when computer.name
      computer.score += 1
    end
  end

  def determine_overall_winner
    if human.score > computer.score
      human.name
    elsif computer.score > human.score
      computer.name
    else
      'tie'
    end
  end

  def display_accumulated_points
    sleep 1
    system 'clear'
    puts "\n#{human.name} accumulated #{human.score} points."
    puts "#{computer.name} accumulated #{computer.score} points.\n\n"

    puts 'Human hand history:'
    human.display_hand_history
    puts "\ncomputer hand history:"
    computer.display_hand_history
  end

  def display_overall_winner(overall_winner)
    display_accumulated_points
    puts "\n|======= Overall winner =======|"

    case overall_winner
    when human.name
      puts "\n=> #{human.name} is the overall winner."
    when computer.name
      puts "\n=> #{computer.name} is the overall winner."
    else
      puts "\n=> It's a tie"
    end
  end
end
