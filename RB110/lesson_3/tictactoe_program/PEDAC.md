Pseudocode
flowchart understanding
edge cases
test cases

Layers of PEDAC

High level problem:
Computer and player takes turn choosing a spot on the board. Once a spot is taken up, it cannot be chosen. If either computer or player have three spots in consequitve order, they win. 

# what goes on a flowchart?
The below flow is not clear. keep it high level.

Show welcome screen
Decide who will go first and what symbol they will use (O or X)
validate input 
Display starting board.
4. if board full output tie
first player chooses a spot
  - validate spot
    - if valid show board with spot filled
    - else go back to player 1 choice
check for winner
  - if yes output winner
  - no, continue 
second player chooses spot
  - validate spot
    - if valid show board with spot filled
    - else go back to 4.
check for winner
  - if yes output winner
  - no, go back to 4.

ideas:
- 3x3 board. nested array with nil values to start? and use nil to determine full board
- use index values for win: 3 conditions for winning, 
  - value in array same values
  - values in separate arrays but same index has same values
  - values in consequtive index values have same values (1,2,3 or 3,2,1)
- string interpolation for displaying board?

How to go about breaking down the problem.
- high level flow
- high level process

- subprocess flow
- detailed subprocess

flow
- welcome user
- Choose whether computer (X) or user (O) will go first
- validate input
- loop
  - First player board choice
    - validate choice
    - winner? or board full?
    - Display board
  - second player choice
    - validate choice
    - winner? or board full?
    - Display board
- Display board and outcome statement

methods:
- validating choice (if board choice already selected)
- processing winner condition
- processing if board is full
- update board
- display board
- process for computer choice
- display outcome

Problems:
inputs: string that indicates board spots
output: display board with choices 

implicit:
- there may not be a winner
- computer choice random?
explicit:
- game ends when board is full

data structure:
- nested array for board

Algo:
Display welcome message to the user.
Prompt the user for their name and store it.
initalize an array with three nested arrays with string numbers 1,2,3; 4,5,6; 7,8,9 
display board.
Loop 
  Prompt the user if they want to go first and store input.
  break if who_goes_first_input_valid? method call returns true
Loop
  if board full
    reassign outcome variable
    break
  else
    prompt the first user for their board input or call computer input method 
    validate if board choice is not already selected
    see if there is a winner
     if yes,
       reassign outcome variable 
       break out of loop
     else
      display board
  if board full
    reassign outcome variable
    break
  else
    prompt the second user for their board input or call computer input method 
    validate if board choice is not already selected
    see if there is a winner
     if yes,
       reassign outcome variable
       break out of loop
     else
      display board
Display board and value of outcome variable.

who_goes_first_input_valid? method
input: string
output: boolean

if the string converted to lowercase and with whitespace removed matches computer or user name return true else return false

display_board method
input: board array
output: string

options:
- can just display each array index using string interpolation. 
- how would the user choose if empty square. use integer value for each square?

iterate through the board_arr
  display each index value to the screen using string interpolation with each index value written out with '|' character before and after each index value

is_board_full? method
input: board arr
output: boolean

iterate through board arr
  iterate through each nested arr
    return true if element does not equal 'o' or 'x'
    else false

update_board method
input: board array, input_player
output: nil, mutates board_arr object

initalize counter variable with 1
iterate through board_arr
  iterate through each nested arr
    if the counter converted to a string equals the value at the array index
      if input_player is user, reassign index value with 'o'
      else reassign index value with 'x'
      increment counter variable by 1

win? method
input: board array and player input type
output: boolean

notes:
0,1,2 
0,1,2
2,1,0
0, 0, 0
1,1,1
2,2,2
- don't want to have to manually type out every permutation
- the method might be too long. helper methods

# rows
iterate through each nested array
  - if the nested array equals [input, input, input], return true

# cross
Iterate through each nested array with index => each iteration should load each nested array
  - map the element in each nested array that has same index value as the nested array have in the board array.
  - if the newly mapped array is equals to [input, input, input], return true
reverse the board array and do the same as above

# vertical
initalize index variable with integer 0
  Loop 
  iterate through the board array
    - map new array with the elements from each nested array with the index value of assigned to the index variable
    - if the newly mapped array is equals to [input, input, input], return true. 
  increment index by 1 

# computer choosing method

computer_choice method
input: board_arr

collapse the nested arrays within the board array into a single array (new array)
Remove elements 'o' and 'x' from the array. This leaves you with the available choices.
<!-- Choose randomly from the array and return the string number chosen -->

immediate_threat method
create a new arrays for horizontal, vertical, and cross win conditions. if array has 2 'o's then its an immediate threat. 
grab the number not picked and update board with that number as the pick.