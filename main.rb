require_relative 'libs/board'
require_relative 'libs/player'

play = true

board = Board.new

player1 = Player.new('X')
player2 = Player.new('O')

puts 'Welcome to tic-tac-toe'

while play == true
  board.show_board
  board.swap_position(player1.type)
  if board.check_winner
    board.show_board
    puts "Parabéns #{player1.type} ganhou o jogo!"
    break
  end
  if board.check_tie.zero?
    puts 'é um empate'
    break
  end
  board.show_board
  board.swap_position(player2.type)
  if board.check_tie.zero?
    puts 'é um empate'
    break
  end
  board.check_winner
  next unless board.check_winner

  board.show_board
  puts "Congrats #{player2.type} wins the game"
  break

end
