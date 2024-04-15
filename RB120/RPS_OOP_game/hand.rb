class Hand
  attr_reader :value

  OPTIONS = %w(rock paper scissors lizard spock)
  WINS_AGAINST = { 'rock' => ['scissors', 'lizard'],
                   'paper' => ['rock', 'spock'],
                   'scissors' => ['paper', 'lizard'],
                   'lizard' => ['paper', 'spock'],
                   'spock' => ['rock', 'scissors'] }

  def initialize(value)
    @value = value
  end

  def self.display_options
    puts ''
    OPTIONS.each do |option|
      puts "- #{option}"
    end
    puts ''
  end

  def to_s
    value
  end

  def >(other_hand)
    WINS_AGAINST[value].include?(other_hand.value)
  end

  def <(other_hand)
    !(WINS_AGAINST[value].include?(other_hand.value))
  end
end

# class Rock < Hand
# end

# class Paper < Hand
# end

# class Scissors < Hand
# end

# class Lizard < Hand
# end

# class Spock < Hand
# end
