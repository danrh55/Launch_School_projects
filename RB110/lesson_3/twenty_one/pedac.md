# main
round_counter = 1

display_greeting
shuffle_deck!
set_table!(round_counter)

loop do
  deal_hands!
  display_table
  play_round
  round_counter += 1
  break unless play_again?
  set_table!(round_counter)
end

1. High level flow of program => break up into component pieces
  - break up into methods
    - think only about the input, intermediate, output data structure.
    - return value
    - how the method will interact with other methods in your program
3. actual implementation details of each method. 

# high level flow
choose_dealer()
display_greeting()
initalize_table()
Loop
  deal_hands!()
  display_table()
  play_round()
  break unless play_again?
end

input_validation(valid_options, input)
- input validation for valid option (arr?), including empty input

choose_dealer()
- arr for the list of dealers
- need input validation
- return string value, chosen dealer's name

  display list of dealer choices.
  loop
    get input from user
    break if input includes the dealer choice
  return input

display_greating()
- nothing passed in
- displays to the screen
- return no meaningful value

grab_names()
- nothing passed in, returns an array of names
- needs input validation

  num_players()

  loop num_players
    ask the user the player's name
    grab the each player's name
    append each input to names_arr if not empty string
    display invalid input
  return names_arr

num_players()
  loop do
    display prompt for inputting number of players
    grab user input
    break if input 1,2,3,4,or 5
  return input

initalize_table()
  arr = grab_names()
  initalize empty hash
  iterate through names arr
      add name as a key, value as an array with the first element being an empty array, and second being a empty string
  add the dealer as a key, value as the same above. 
  return hash

deal_hands!(hash)
- pass in array of player names, 
- return hash of initial hands. player name is the key, array of values that represent the hand

  loop twice
    append the return value of hit_me() method call to the first index of the key value. 
  return hash

display_hand(hash, name)
  display "#{name}'s current hand is:"
  if name equals dealer
    dealer_first_card = (dealer == 'hidden' ? 'hidden' : index[0])
    display each index using string interpolation, "[#{dealer_first_card}, #{index[1]}]"
  else    
    display value first index (hand)

display_table(hash)
  iterate through names_arr
    call display_hand(hash, name)

play_round(hash)
- takes in inital hand hash. 
- return no meaningful value.
- play_status hash with the name as key, inital value string ''. can take on values hit, stay or bust.
  loop
    iterate through hash
      skip iteration if second index value is 'stay' or 'bust'
      display_hand(hash, name)
      decision = decision(name)
      update_hand!(hash, name, decision)
      display_table(hash)
    break if no_more_hits?(hash)
  display_results() 

player_decision(name)
- nothing passed in
- returns string value of player decision.
  if dealer, return the value of the dealer_decision method call.
  else
    display prompt to user for input
    return input if valid_input?([])

dealer_decision()
  'hit' method if sum_hand < 17
  else 'stay'

update_hand!(hash, name, decision)
  when 'stay'
    update second index with 'stay'
  when 'hit'
    append first index value with the return value of hit_me() method call
    sum_hand()
    status = bust if sum_hand > 21 else hit
    reassign play status with the value of variable status

no_more_hits?(hash)
  iterate through the hash return false if second index value equals 'hit'

hit_me!(deck_arr)
  randomly select an index value of the deck based on deck array size   1.
  delete and return the element from the deck array at that index.

sum_hand(hash, name)
- returns integer value
interpreted_arr = interpret_hand(hash, name)
sum interpreted arr

interpret_hand(hash, name)
  iterate through the array in the first index of the array value of the name key. 
    map intermediate new array
      - if j,q,k, return integer 10
      - elsif a
          return integer 11
      - else
          return element
  return convert_ace_values(intermediate array)

convert_ace_values(hand_arr)
  loop
    if the sum of hand_arr > 21
      reverse hand_arr and return first index of 11
      reassign the value to 1 at the above returned index.
      reverse back
    return hand_arr

display_results(hash)
  iterate through each hash key
    display key 
    display the first index value
    display the second index value
    skip the rest if second index value equal 'bust'

    if beat_dealer?()
      display your hand of sum_hand(hash, name) beats the dealer's sum_hand(hash, name)
    else
      display you lost.

beat_dealer?(hash, name)
  sum_hand(hash, name) > sum_hand(hash, dealer)
