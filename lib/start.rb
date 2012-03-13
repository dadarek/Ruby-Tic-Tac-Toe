require_relative 'game'
require_relative 'board'
require_relative 'heuristic'
require_relative 'user_prompter'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'winner_finder'

board = Board.new
prompter = UserPrompter.new
p1 = HumanPlayer.new(prompter)
p2 = ComputerPlayer.new
winner_finder = WinnerFinder.new(board)
game = Game.new(board, winner_finder, p1, p2)
heuristic = Heuristic.new(board, p2, p1)

p2.set_heuristic(heuristic)

game.go

