require_relative 'game'
require_relative 'board'
require_relative 'heuristic'
require_relative 'UI/user_prompter'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'winner_finder'
require_relative 'UI/stream_board_printer'

printer = StreamBoardPrinter.new
p1 = HumanPlayer.new UserPrompter.new
p2 = ComputerPlayer.new Heuristic.new
board = Board.new(p1, p2)
game = Game.new(board, printer)


game.go

