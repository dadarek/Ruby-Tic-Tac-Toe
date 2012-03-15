require_relative 'game'
require_relative 'board'
require_relative 'heuristic'
require_relative 'minimax_heuristic'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'winner_finder'
require_relative 'game_runner'
require_relative 'game_factory'
require_relative 'UI/user_prompter'
require_relative 'UI/stream_ui'

ui = StreamUI.new
prompter = UserPrompter.new

p1 = HumanPlayer.new prompter
p2 = ComputerPlayer.new MinimaxHeuristic.new

factory = GameFactory.new(Game, Board, p1, p2, ui)

runner = GameRunner.new(prompter, factory)
runner.go

