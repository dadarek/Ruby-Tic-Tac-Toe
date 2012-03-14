require 'game_factory'

describe GameFactory do
  it "creates a game with given board, players, and UI" do
    p1 = "P1"
    p2 = "P2"
    ui = "UI"

    factory = GameFactory.new(DummyGame2, DummyBoard, p1, p2, ui)
    game = factory.create

    game.board.p1.should == p1
    game.board.p2.should == p2
    game.ui.should == ui
  end

  class DummyBoard
    attr_accessor :p1, :p2
    
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end
  end

  class DummyGame2
    attr_accessor :board, :ui

    def initialize(board, ui)
      @board = board
      @ui = ui
    end
  end

end
