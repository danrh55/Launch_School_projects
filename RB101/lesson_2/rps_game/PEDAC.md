In this assignment, we'll build a Rock Paper Scissors game. The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed

# bonus features
Lizard Spock

This game is a variation on the Rock Paper Scissors game that adds two more options - Lizard and Spock. The full explanation and rules are here. There's also a hilarious Big Bang Theory video about it here.

The goal of this bonus is to add Lizard and Spock into your code.

Typing the full word "rock" or "lizard" is tiring. Update the program so the user can type "r" for "rock," "p" for "paper," etc. Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?

Keep score of the player's and computer's wins. When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. Don't add your incrementing logic to display_results. Keep your methods simple; they should perform one logical task — no more, no less.

Problem:
Input: takes in one of the following inputs from the user: rock, paper, scissors, lizard, spock.
Output: the winner of each round and the grand winner

assumption:

explicit:
- must have three wins to finish game

implicit:
- there are only 5 different inputs and their short versions
- the computer's choice is random
- there can only be a winner or a draw
- redo round if outcome is a draw

# Example
rock, scissor = > user wins
spock, lizard => computer wins
rock, rock => draw, redo round

# Data structures
input: create a hash with the input types as keys, value as an array with each type's input options
output: output is a string
inbetween: ?

# Algorithm

method definitions
create welcome_message method
  - output to the user Welcome, name! Let's play rock, paper, scissors, lizard, spock!"

create method grab_name
  - create an infinite loop
    - prompt the user to enter their name. 
    - grab the user input 
    - remove any white space from user input.
    - store the input to a name variable.
    - break out of loop if name is not equal to '' (no input).
    - prompt the user that they must enter a name
  - return name 

create a method grab_user_choice
  - create infinite loop
    - prompt the user for their input
    - grab user input 
    - pass in the input to the choice_valid method.
    - return the input if choice_valid method returns true

create method choice_valid that takes in user input as argument
  - if user input equals '' return false 
  - iterate through the input_type key, value pair data structure
    - explicitly return true if user input is included in one of the value arrays
  - return false

create a method that grabs the computer's choice
  - grab a random number between 0 and the input_type data structure size minus 1
  - assign that random number to variable random_type_index
  - assign the variable computer_choice equal to the key of the input_type data structure at the random_type_index  
  - return computer_choice 

create a did_user_win method that takes in the user choice and computer choice as arguments
  - when the user choice is rock, check if computer choice is either spock or paper, 
    - if true return 'no' else 'yes'
  - when the user choice is paper, check if computer choice is either scissor or lizard 
    - if true return 'no' else 'yes'
  - when the user choice is scissor, check if computer choice is either rock or spock, 
    - if true return 'no' else 'yes'
  - when the user choice is lizard, check if computer choice is either scissor or rock, 
    - if true return 'no' else 'yes'
  - when the user choice is spock, check if computer choice is either lizard or paper, 
    - if true return 'no' else 'yes'
  - when user choice equals computer choice
    - return 'draw'

create method track_wins 
  - if the did_user_win equal 'yes'
    - increment num_user_wins by 1
  - if the did_user_win equal 'no'
    - increment num_computer_wins by 1
  - return num_user_wins and num_computer_wins

create method out_round_result that takes in did_user_win variable as an argument
  - if did_user_win equals 'yes'
    - output to the user: 'user_input beats computer_input, name, you win this round'
  - if did_user_win equals 'draw'
    - output to the user: I chose computer_choice also, so it's a draw. Let's play the round again.
  - if did_user_win equals 'no' 
    - output to the user: 'user_input loses to computer_input, name, you lost this round. LoL.'

create output_grand_winner with num_user_wins and num_computer_wins as parameters
  if num_user_wins > num_computer_wins
    output to the user: "Name, you are the grand winner! Congratulations."
  if num_user_wins < num_computer_wins
    output to the user: 'Sorry, it looks like I'm the grand winner. Too bad :(' 

create play_again method
  create an infinite loop
    - prompt the user if they want to play again?
    - assign the user input to the answer variable.
    - if the answer is either yes or y
      - return true
    - if the answer either no or n
      - return false
    - else
      - output that its an invalid input.

main
create a hash with each input type as key and the values as an array of the input options for each type. assign it to a constant variable input_types 
call the grab_name method and assign the return value to a constant variable name
call the welcome_message method
create an infinite loop
  - set the num_user_wins = 0
  - set the num_computer_wins = 0
  - while the num_user_wins and num_computer_wins is less than 2
    - call the grab_user_choice method and assign it to the variable user_choice
    - call the grab_computer_choice method and assign it to the variable computer_choice
    - call the did_user_win method with user choice and computer choice as arguments and assign the return value to variable did_user_win
    - call the output_round_result method
    - call the track_wins method with did_user_win as an argument. reassign the num_user_wins and num_computer_wins with the return value.
  - call the output_grand_winner method with num_user_wins and num_computer_wins as arguments
  - break out loop if play_again method call returns false 
output to the user: "Thanks for playing. See you again soon, Name"
