require 'pry'

# constants
DEALER_NAME = ['Justin', 'Derek', 'Mark'].sample
TABLE = []
DECK = []
NUM_DECKS = 8
RESHUFFLE_NUM = 5
NUM_SPOTS = 5
DEALER_LIMIT = 17
GAME_NUM = 21

# methods
def display_greeting
  puts 'Welcome to my blackjack table.'
  puts "My name is #{DEALER_NAME}\n "
  puts "Okay, folks. I can take #{NUM_SPOTS} players max."
end

def initialize_spots!
  NUM_SPOTS.times do |spot|
    TABLE.push(["Spot: #{spot + 1}", [], nil])
  end
  TABLE.push(["Dealer: #{DEALER_NAME}", [], nil])
end

def shuffle_deck!
  DECK.clear
  new_cards = (['A', 'J', 'Q', 'K'] + (2..10).to_a) * 4 * NUM_DECKS
  DECK.push(new_cards).flatten!
end

def initalize_table!(round_counter)
  if round_counter == 1
    insert_players!
  else
    reset_table!
  end
  shuffle_deck! if round_counter % RESHUFFLE_NUM == 0
end

def insert_players!
  TABLE.each_with_index do |player_info, player_index|
    next if player_info[0] == "Dealer: #{DEALER_NAME}"
    name = grab_name(player_index + 1)
    if name == 'Stop'
      break
    else
      player_info[0] = name
    end
    puts "\nThat's the limit folks!" if player_index + 1 == NUM_SPOTS
  end
end

def grab_name(player_num)
  loop do
    puts "\nPlayer #{player_num} enter your name."
    puts 'Enter \'stop\' if that\'s all the players.'
    name = gets.chomp.strip.downcase.capitalize

    if name == ''
      puts "\nSorry didn't get your name"
    elsif name == 'Stop' && player_num == 1
      puts "\nWe need at least one player."
    else
      return name
    end
  end
end

def reset_table!
  TABLE.each do |player_info|
    player_info[1].clear
    player_info[2] = nil
  end
end

def deal_hands!
  2.times do |_|
    TABLE.each do |player_info|
      player_info[1].push(hit_me!) unless player_info[0] =~ /Spot: \d/
    end
  end
end

def hit_me!
  DECK.delete_at(DECK.index(DECK.sample))
end

def display_table(dealer_visibility)
  box_size = longest_length + 6
  border = '-' * ((box_size * NUM_SPOTS) + (NUM_SPOTS + 1))

  puts border
  display_dealer_hand(dealer_visibility, border)
  puts border
  display_players_hands(box_size)
  puts border
  if dealer_visibility == 'hidden'
    display_player_status(box_size)
  else
    display_results(box_size)
  end
  puts border
end

def decision(player)
  if player == "Dealer: #{DEALER_NAME}"
    sum_hand(TABLE[-1][1]) < DEALER_LIMIT ? 'hit' : 'stay'
  else
    loop do
      puts "\n#{player}, what's your call (hit or stay)?"
      decision = gets.chomp.downcase
      return decision if ['hit', 'stay'].include?(decision)
      puts 'Invalid input. Please try again.'
    end
  end
end

def status(hand, decision)
  sum = sum_hand(hand)

  if decision == 'hit'
    sum > GAME_NUM ? 'bust' : 'hit'
  else
    'stay'
  end
end

def display_dealer_hand(dealer_visibility, border)
  dealer_hand = if dealer_visibility == 'hidden'
                  ['hidden'] + TABLE[-1][1][1..-1]
                else
                  TABLE[-1][1]
                end
  puts "|#{TABLE[-1][0].center(border.length - 2)}|"
  puts "|#{dealer_hand.to_s.center(border.length - 2)}|"
end

def combine_strings(values, box_size)
  "|#{values.map do |value|
    "#{value.to_s.center(box_size)}|"
  end.join}"
end

def names_arr
  TABLE.each_with_object([]) do |player_info, arr|
    arr.push(player_info[0]) unless player_info[0] == "Dealer: #{DEALER_NAME}"
  end
end

def hands_arr
  TABLE.each_with_object([]) do |player_info, arr|
    arr.push(player_info[1]) unless player_info[0] == "Dealer: #{DEALER_NAME}"
  end
end

def display_players_hands(box_size)
  puts combine_strings(names_arr, box_size)
  puts combine_strings(hands_arr, box_size)
end

def display_results(box_size)
  results = TABLE[0..-2].map.with_index do |player_info, player_index|
    grab_player_result(player_index, sum_hand(player_info[1]), player_info[2])
  end
  puts combine_strings(results, box_size)
end

def grab_player_result(player_index, player_sum, player_status)
  return '' if TABLE[player_index][0] =~ /Spot: \d/
  dealer_status = TABLE[-1][2]
  dealer_sum = sum_hand(TABLE[-1][1])


  if player_status == 'bust'
    dealer_status == 'bust' ? 'tie' : 'lost'
  elsif dealer_status == 'bust'
    'win'
  elsif dealer_sum == player_sum
    'tie'
  else
    dealer_sum > player_sum ? 'lost' : 'win'
  end
end

def display_player_status(box_size)
  statuses = TABLE[0..-2].map do |player_info|
    player_info[2] == 'bust' ? 'bust' : ''
  end
  puts combine_strings(statuses, box_size)
end

def longest_length
  longest = 0
  TABLE.each do |player_info|
    next if player_info[0] == "Dealer: #{DEALER_NAME}"
    name_length = player_info[0].length
    hand_length = player_info[1].to_s.length
    length = [name_length, hand_length].max
    longest = length if length > longest
  end
  longest
end

def player_hands
  TABLE.each_with_object([]) do |player_info, arr|
    arr.push(player_info[1]) unless player_info[0] == "Dealer: #{DEALER_NAME}"
  end
end

def no_more_hits?
  TABLE.each do |player_info|
    return false if player_info[2] == 'hit'
  end
  true
end

def sum_hand(hand)
  temp_ace_value = 11

  interim_hand = hand.map do |card|
    if ['J', 'Q', 'K'].include?(card)
      10
    elsif card == 'A'
      temp_ace_value
    else
      card
    end
  end
  if interim_hand.index(temp_ace_value).nil?
    interim_hand.sum
  else
    convert_ace_values(interim_hand).sum
  end
end

def convert_ace_values(interim_hand)
  r_interim_hand = interim_hand.reverse
  loop do
    if interim_hand.sum > GAME_NUM
      if r_interim_hand.index(11).nil?
        break
      else
        r_interim_hand[r_interim_hand.index(11)] = 1
      end
    end
    break if r_interim_hand.sum < GAME_NUM
  end
  r_interim_hand.reverse
end

def player_statuses
  TABLE.map do |player_info|
    player_info[2]
  end
end

def play_again?
  choice = nil

  loop do
    puts "\nDo you want to play again (y/n)"
    choice = gets.chomp.downcase
    break if ['y', 'n'].include?(choice)
    puts 'Invalid input.'
  end

  if choice == 'y'
    puts "\nLet's play another round!"
    true
  else
    puts "\nSee you later."
    false
  end
end

# main
round_counter = 1

display_greeting
initialize_spots!
shuffle_deck!
initalize_table!(round_counter)
sleep(0.5)
system 'clear'

loop do
  deal_hands!

  loop do
    TABLE.each do |player_info|
      next if %w(stay
                 bust).include?(player_info[2]) || player_info[0] =~ /Spot: \d/
      display_table('hidden')
      decision = decision(player_info[0])
      # updates player hand
      player_info[1] << hit_me! if decision == 'hit'
      # updates player status
      player_info[2] = status(player_info[1], decision)
      system 'clear'
    end
    break if no_more_hits?
  end
  display_table('visible')
  round_counter += 1
  break unless play_again?
  initalize_table!(round_counter)
end
