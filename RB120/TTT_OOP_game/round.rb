require './display'

class Round
  include Display

  def play(round)
    current_player = set_starter

    loop do
      display_clear
      puts "Round: #{round}\n\n"
      current_player.mark(board)
      update_winner(current_player)
      current_player = switch(current_player)
      break unless round_winner.nil?
    end
  end

  def display_outcome
    display_clear
    board.show

    case round_winner
    when 'tie'
      puts "\nIt's a tie."
    else
      puts "\nThe winner is #{round_winner}.\n\n"
    end
  end

  private

  def initialize(human, computer)
    @board = Board.new
    @human = human
    @computer = computer
  end

  attr_reader :round_winner, :human, :computer, :board

  def switch(current_player)
    current_player == human ? computer : human
  end

  def update_winner(current_player)
    if winner?
      @round_winner = current_player.name
      current_player.points += 1
    elsif board.full?
      @round_winner = 'tie'
    end
    nil
  end

  def winner?
    board.sections.any? do |section|
      section.count(human.mark_sym) == 3 ||
        section.count(computer.mark_sym) == 3
    end
  end

  def set_starter
    choice = choose_starter
    choice == human.name ? human : computer
  end

  def choose_starter
    loop do
      display_clear
      puts "Who goes first this round? #{human.name} or #{computer.name}."
      name = gets.chomp.strip.capitalize
      return name if [human.name, computer.name].include?(name)
      puts 'Invalid player. Please try again.'
    end
  end
end
