require 'game_factory'
require 'computer_player'
require 'human_player'
require 'dummies/dummy_game'
require 'dummies/dummy_board'
require 'dummies/dummy_ui'

describe GameFactory do
  it "creates a game with given board, players, and UI" do
    ui = DummyUI.new
    ui.computer_vs_computer_responses = [true]
    
    factory = GameFactory.new(DummyGame, DummyBoard, ui)
    game = factory.create
    DummyGame.games_created.should == 1
    DummyGame.games_played.should == 0
  end

  it "creates 2 computer players" do
    factory = GameFactory.new(nil, nil, nil)

    players = factory.create_computer_vs_computer
    assert_players(players, ComputerPlayer, ComputerPlayer)
  end

  it "creates computer and player in correct order" do
    ui = DummyUI.new
    ui.go_first_responses = [true, false]
    factory = GameFactory.new(nil, nil, ui)

    players = factory.create_computer_vs_human
    assert_players(players, HumanPlayer, ComputerPlayer)

    players = factory.create_computer_vs_human
    assert_players(players, ComputerPlayer, HumanPlayer)
  end

  it "creates human with ui" do
    ui = "Some UI"
    factory = GameFactory.new(nil, nil, ui)

    player = factory.create_human
    player.ui.should == ui
  end

  it "creates appropriate players according to ui" do
    ui = DummyUI.new
    ui.go_first_responses = [false, true, false]
    ui.computer_vs_computer_responses = [false, true, true, false, false]
    
    factory = GameFactory.new(nil, nil, ui)
    create_players_and_assert(factory, ComputerPlayer, HumanPlayer)
    create_players_and_assert(factory, ComputerPlayer, ComputerPlayer)
    create_players_and_assert(factory, ComputerPlayer, ComputerPlayer)
    create_players_and_assert(factory, HumanPlayer, ComputerPlayer)
    create_players_and_assert(factory, ComputerPlayer, HumanPlayer)
  end

  def create_players_and_assert(factory, expected_first_player, expected_second_player)
    players = factory.create_players
    assert_players(players, expected_first_player, expected_second_player)
  end

  def assert_players(players, expected_first_player, expected_second_player)
    players[0].class.should == expected_first_player
    players[1].class.should == expected_second_player
  end
end
