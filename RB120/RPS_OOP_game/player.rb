require './hand'

class Player
  attr_reader :name, :hand_history
  attr_accessor :score

  def initialize
    @hand_history = []
    @score = 0
  end

  def hand
    hand_history.last
  end

  def reset
    hand_history.clear
    self.score = 0
  end

  def display_hand_history
    hand_history.each_with_index do |hand, round|
      puts "Round #{round + 1}: #{hand}"
    end
  end

  protected

  def instantiate_hand(choice)
    Hand.new(choice)
  end
end

class Human < Player
  def initialize
    super()
    set_name
  end

  def set_name
    loop do
      puts 'Please enter in your name.'
      print 'Name: '
      @name = gets.chomp.strip.capitalize
      break unless name == ''
      puts 'You can\'t leave your name blank.'
      sleep 1
      system 'clear'
    end
    system 'clear'
  end

  def pick
    choice = ''

    loop do
      puts "\n#{name} choose from one of the following options."
      Hand.display_options
      print 'Choice: '
      choice = gets.chomp.downcase
      break if Hand::OPTIONS.include?(choice)
      puts "\nInvalid input. Please try again.\n"
    end
    hand_history << instantiate_hand(choice)
  end
end

class Computer < Player
  PICK_BIAS = { 'R2D2' => { rock: 20, paper: 20, scissors: 20, lizard: 20,
                            spock: 20 },
                'Hal' => { rock: 40, paper: 15, scissors: 10, lizard: 5,
                           spock: 30 },
                'Jarvis' => { rock: 70, paper: 5, scissors: 10, lizard: 5,
                              spock: 10 } }

  def initialize
    super()
    @name = %w(R2D2 Hal Jarvis).sample
  end

  def pick
    rand_num = rand(100)
    temp_sum = 0

    PICK_BIAS[name].each do |hand, value|
      temp_sum += value
      if (0...temp_sum).include?(rand_num)
        hand_history << instantiate_hand(hand.to_s)
        break
      end
    end
  end
end
