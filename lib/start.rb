require_relative 'game'
require_relative 'board'
require_relative 'game_runner'
require_relative 'game_factory'
require_relative 'UI/stream_ui'

ui = StreamUI.new

factory = GameFactory.new(Game, Board, ui)

runner = GameRunner.new(ui, factory)
runner.go

