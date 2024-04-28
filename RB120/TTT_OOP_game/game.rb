require './board'
require './player'
require './display'
require './round'

class Game
  include Display

  def set_players
    @human = Human.new
    @computer = Computer.new(human.mark_sym)
  end

  def play
    total_rounds = choose_num_rounds

    1.upto(total_rounds) do |round_num|
      round = Round.new(human, computer)
      round.play(round_num)
      round.display_outcome
      display_total_points
      sleep 1
    end
  end

  def play_again?
    answer = ''

    loop do
      puts "\nDo you want to play again? (y/n)"
      answer = gets.chomp.strip.downcase
      break if ['y', 'n'].include?(answer)
      puts 'Invalid input. Please enter either y or n.'
      display_clear
    end
    answer == 'y'
  end

  def welcome_msg
    display_clear
    puts "Let's play tic tac toe!"
  end

  def goodbye_msg
    puts "\nGoodbye #{human.name}. See you next time."
    display_clear
  end

  def display_outcome
    display_clear
    display_total_points

    if human.points > computer.points
      puts "#{human.name} won the game!"
    elsif computer.points > human.points
      puts "#{computer.name} won the game!"
    else
      puts "The game ended in a tie!"
    end
  end

  def reset
    human.points = 0
    computer.points = 0
  end

  private

  attr_reader :human, :computer

  def display_total_points
    puts "#{human.name} has #{human.points} points."
    puts "#{computer.name} has #{computer.points} points\n\n"
  end

  def choose_num_rounds
    loop do
      display_clear
      puts "How many rounds do you want to play?"
      choice = gets.chomp.strip
      return choice.to_i unless choice =~ /[\D]/
      puts 'Invalid input. Please try again.'
    end
  end
end
