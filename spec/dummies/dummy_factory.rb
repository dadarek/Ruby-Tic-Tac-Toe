class DummyFactory
  attr_accessor :games_created

  def initialize
    @games_created = 0
  end

  def create
    @games_created += 1
    DummyGame.new(nil, nil)
  end
end
