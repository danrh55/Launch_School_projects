require './display'

class Player
  attr_reader :name, :mark_sym
  attr_accessor :points

  include Display

  def initialize
    @name = set_name
    @mark_sym = choose_mark_sym
    @points = 0
  end

  def mark(board)
    choice = choose_spot(board)
    display_spot_choice(choice)
    idx = choice - 1
    board.spots[idx] = mark_sym
    display_clear
  end

  def display_spot_choice(choice)
    puts "=> #{name} chose spot #{choice}."
  end
end

class Human < Player
  private

  def set_name
    loop do
      puts "\nPlease enter in your name."
      print 'Name: '
      name = gets.chomp.strip.capitalize
      display_clear
      return name unless name == ''
      puts "\nYou left your name empty!"
      display_clear
    end
  end

  def choose_mark_sym
    loop do
      puts "\n#{name}, what mark do you want to use?"
      puts "Choose from the following options."
      display_mark_options
      print "\nMark: "
      mark_sym = gets.chomp.strip.upcase
      return mark_sym if Board::MARK_SYMS.include?(mark_sym)
      puts "\nInvalid mark symbol. Please try again."
      display_clear
    end
  end

  def display_mark_options
    Board::MARK_SYMS.each do |mark_sym|
      puts "- #{mark_sym}"
    end
  end

  def choose_spot(board)
    loop do
      board.show
      puts "\nPlease choose an empty spot."
      choice = gets.chomp.strip.to_i
      return choice if board.empty_spots.include?(choice)
      puts invalid_spot(choice)
      display_clear
    end
  end

  def invalid_spot(choice)
    if (1..9).include?(choice)
      "\n=> That spot is already taken!"
    else
      "\n=> That spot doesn't exist!"
    end
  end
end

class Computer < Player
  private

  attr_reader :other_mark_sym

  def initialize(other_mark_sym)
    @other_mark_sym = other_mark_sym
    super()
  end

  def set_name
    ['Hal', 'Jarvis'].sample
  end

  def choose_mark_sym
    remaining_options = Board::MARK_SYMS - [other_mark_sym]
    remaining_options.sample
  end

  def attack_sections(board)
    board.sections.select do |section|
      section.count(mark_sym) == 1 &&
        section.count(other_mark_sym) == 0
    end
  end

  def kill_sections(board)
    board.sections.select do |section|
      section.count(mark_sym) == 2 &&
        section.count(other_mark_sym) == 0
    end
  end

  def defend_sections(board)
    board.sections.select do |section|
      section.count(other_mark_sym) == 2 &&
        section.count(mark_sym) == 0
    end
  end

  def choose_section(board)
    return kill_sections(board).sample if kill_sections(board).any?
    return defend_sections(board).sample if defend_sections(board).any?
    return attack_sections(board).sample if attack_sections(board).any?
    board.spots
  end

  def choose_spot(board)
    choice_arr = choose_section(board)
    choice_arr.select { |spot| (1..9).include?(spot) }.sample
  end
end
