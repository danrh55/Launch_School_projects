require './game'

game = RPSGame.new

loop do
  game.welcome
  game.play
  break unless game.play_again?
  game.reset
  system 'clear'
end
