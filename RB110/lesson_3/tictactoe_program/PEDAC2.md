The first tictactoe logic was unnecessarily too complicated. Too much looping. 

additonal functionality:
- first to win 5 games win the battle. 
- defence and attack.

logic:
- checking for winner after each pick.
- checking for if board full
- state of board for attacking and attacking. This should be connected to checking for winner 
- keeping track of wins for each player. 

Flow:
- # game intro
  - welcome message
  - # grabs user name
- # decide who goes first (computer or user)
- loop
  - # initalize board
  - # display board
  - initalize variables to track win counts for both players
  - loop
    - # pick spot (computer or user)
      - # helper method for computer attacking
      - # helper method for computer defending 
    - # update board
    - # display board
    - # break if board_full? or player_won?
    - # alternate player
  - # increment user or computer win count by 1 depending on game_won_by 
  - break out if win count for computer or user is equal to 5

- prompt user if they want to play again.
- # break out of loop unless the user wants to play again.

computer_attack_spot method
input: board array
output: string number or nil

data structure:
- array

algo:
- call row method and iterate through each row array.
  - if row array has two or more 'o' values return the row array - minus
