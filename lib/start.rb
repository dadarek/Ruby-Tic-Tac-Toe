require_relative 'game'
require_relative 'board'
require_relative 'heuristic'
require_relative 'UI/user_prompter'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'winner_finder'
require_relative 'UI/stream_board_printer'

prompter = UserPrompter.new
printer = StreamBoardPrinter.new
p1 = HumanPlayer.new(prompter)
p2 = ComputerPlayer.new
board = Board.new(p1, p2)
winner_finder = WinnerFinder.new(board)
game = Game.new(board, winner_finder, printer, p1, p2)
heuristic = Heuristic.new(board, p2, p1)

p2.set_heuristic(heuristic)

game.go

