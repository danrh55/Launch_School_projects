require './game'
require './display'

game = Game.new
game.welcome_msg
game.set_players

loop do
  game.play
  game.display_outcome
  break unless game.play_again?
  game.reset
end
game.goodbye_msg
